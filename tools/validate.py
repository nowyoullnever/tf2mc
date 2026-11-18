#!/usr/bin/env python3
"""Offline structural validator for TF Mini Weapons.

It deliberately does not report game-runtime PASS results.  Run from the
datapack root: python tools/validate.py [path-to-pack].
"""
from __future__ import annotations
import json, re, sys
from pathlib import Path

ROOT = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else Path(__file__).resolve().parents[1]
errors: list[str] = []

for required in ("pack.mcmeta", "data/minecraft/tags/function/load.json", "data/minecraft/tags/function/tick.json", "data/tfmini/function/load.mcfunction", "data/tfmini/function/tick.mcfunction", "data/tfmini/predicate/fire_held.json"):
    if not (ROOT / required).is_file(): errors.append(f"missing required file: {required}")

for required_dir in ("data/tfmini/function/player", "data/tfmini/function/input", "data/tfmini/function/weapon/minigun", "data/tfmini/function/weapon/sniper", "data/tfmini/function/weapon/rocket", "data/tfmini/function/weapon/medic", "data/tfmini/function/ray", "data/tfmini/function/damage", "data/tfmini/function/ui", "data/tfmini/function/give", "data/tfmini/function/admin", "data/tfmini/function/test", "data/tfmini/tags/block"):
    if not (ROOT / required_dir).is_dir(): errors.append(f"missing required directory: {required_dir}")

for path in ROOT.rglob("*.json"):
    try: json.loads(path.read_text(encoding="utf-8"))
    except Exception as exc: errors.append(f"invalid JSON {path.relative_to(ROOT)}: {exc}")

custom_damage_dir = ROOT / "data/tfmini/damage_type"
if custom_damage_dir.exists() and any(custom_damage_dir.rglob("*.json")):
    errors.append("custom damage_type registry entries must not remain")
obsolete_bypass = ROOT / "data/minecraft/tags/damage_type/bypasses_cooldown.json"
if obsolete_bypass.exists():
    errors.append("obsolete custom bypasses_cooldown tag must not remain")

try:
    meta = json.loads((ROOT / "pack.mcmeta").read_text(encoding="utf-8"))["pack"]
    if meta.get("min_format") != [121, 0] or meta.get("max_format") != [121, 0]: errors.append("pack.mcmeta must pin min/max format to [121, 0]")
except Exception as exc: errors.append(f"invalid pack metadata: {exc}")

required_objectives = {"tf_init","tf_weapon","tf_mg_ammo","tf_mg_cd","tf_mg_reload","tf_sn_ammo","tf_sn_cd","tf_sn_reload","tf_sn_charge","tf_sn_scope","tf_sn_use","tf_rk_ammo","tf_rk_cd","tf_rk_reload","tf_rk_fired","tf_rk_muzzle","tf_md_heal","tf_md_self","tf_md_target","tf_fire","tf_player_id","tf_debug","tf_ray_step","tf_ray_hit","tf_ray_type","tf_ray_damage","tf_ray_head","tf_tracer_mod","tf_move","tf_px","tf_py","tf_pz","tf_lpx","tf_lpy","tf_lpz","tf_spread_y"}
match_objectives = {"tf_g_kills","tf_g_base_k","tf_g_base_d","tf_g_round_k","tf_g_round_d","tf_g_team","tf_g_participant","tf_g_state","tf_g_timer","tf_g_total","tf_g_red","tf_g_blu","tf_g_work","tf_g_mm","tf_g_ss"}
load = (ROOT / "data/tfmini/function/load.mcfunction").read_text(encoding="utf-8") if (ROOT / "data/tfmini/function/load.mcfunction").exists() else ""
declared = set(re.findall(r"scoreboard objectives add ([a-z0-9_]+)", load))
errors.extend(f"missing scoreboard declaration: {name}" for name in sorted(required_objectives - declared))
errors.extend(f"missing match scoreboard declaration: {name}" for name in sorted(match_objectives - declared))

init = (ROOT / "data/tfmini/function/player/init_new.mcfunction").read_text(encoding="utf-8") if (ROOT / "data/tfmini/function/player/init_new.mcfunction").exists() else ""
init_required = required_objectives - {"tf_player_id", "tf_debug"}
for name in sorted(init_required):
    if not re.search(rf"scoreboard players (?:set|operation) @s {re.escape(name)}\b", init):
        errors.append(f"new-player state lacks deterministic initialization: {name}")

def function_exists(name: str) -> bool:
    if ":" not in name: return False
    namespace, ident = name.split(":", 1)
    return (ROOT / "data" / namespace / "function" / f"{ident}.mcfunction").is_file()

for path in ROOT.rglob("*.mcfunction"):
    for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
        line = line.strip()
        if not line or line.startswith("#"): continue
        for ref in re.findall(r"(?:run )?function ([a-z0-9_.-]+:[a-z0-9_./-]+)", line):
            if not function_exists(ref): errors.append(f"missing function {ref} referenced by {path.relative_to(ROOT)}:{number}")
        if " entity @s weapon.mainhand " in line and "minecraft:custom_data" not in line:
            errors.append(f"untagged mainhand weapon test in {path.relative_to(ROOT)}:{number}")
        if "data/tfmini/functions" in line: errors.append(f"obsolete plural functions path in {path.relative_to(ROOT)}:{number}")
        if re.match(r"^(unless|if|as|at|positioned|rotated|anchored)\b", line):
            errors.append(f"invalid standalone execute subcommand in {path.relative_to(ROOT)}:{number}")
        if "tfmini:ray:start" in line:
            errors.append(f"invalid function identifier in {path.relative_to(ROOT)}:{number}")
        if "tfmini_new_proxy" in line:
            errors.append(f"stale per-tick proxy pattern in {path.relative_to(ROOT)}:{number}")
        if "tfmini_hitbox" in line and path.relative_to(ROOT).as_posix() not in {"data/tfmini/function/load.mcfunction", "data/tfmini/function/admin/reset.mcfunction"}:
            errors.append(f"hitbox arrows are only allowed in migration cleanup: {path.relative_to(ROOT)}:{number}")
        if "minecraft:arrow" in line and "tfmini_rocket" in line:
            errors.append(f"rockets must use markers, not arrows: {path.relative_to(ROOT)}:{number}")
        if "execute on origin" in line:
            errors.append(f"rocket ownership must use tf_player_id/tf_owner, not execute on origin: {path.relative_to(ROOT)}:{number}")
        if re.search(r"tfmini:(minigun|sniper|rocket)\b", line):
            errors.append(f"obsolete custom damage type reference in {path.relative_to(ROOT)}:{number}")

for path in ROOT.rglob("*.json"):
    if re.search(r'"tfmini:(minigun|sniper|rocket)"', path.read_text(encoding="utf-8")):
        errors.append(f"obsolete custom damage type reference in {path.relative_to(ROOT)}")

rocket_files = list((ROOT / "data/tfmini/function/weapon/rocket").glob("*.mcfunction"))
if any("Owner" in path.read_text(encoding="utf-8") for path in rocket_files):
    errors.append("obsolete arrow Owner NBT remains in rocket functions")

tick_function = (ROOT / "data/tfmini/function/tick.mcfunction").read_text(encoding="utf-8") if (ROOT / "data/tfmini/function/tick.mcfunction").exists() else ""
if "type=minecraft:marker,tag=tfmini_rocket" not in tick_function:
    errors.append("rocket tick must select tfmini_rocket markers")

rocket_reload = (ROOT / "data/tfmini/function/weapon/rocket/reload.mcfunction").read_text(encoding="utf-8")
rocket_shot = (ROOT / "data/tfmini/function/weapon/rocket/shot.mcfunction").read_text(encoding="utf-8")
if "tf_fire" in rocket_reload:
    errors.append("rocket reload depends on global tf_fire rather than rocket-only state")
if "tf_rk_fired" not in rocket_shot:
    errors.append("rocket shot does not set rocket-only reload interruption state")

rocket_explode = (ROOT / "data/tfmini/function/weapon/rocket/explode.mcfunction").read_text(encoding="utf-8")
if "wind/trigger" in rocket_explode:
    errors.append("unverified native wind burst must not be integrated before the standalone POC passes")

if any((ROOT / "data/tfmini/function/player/proxy").glob("*.mcfunction")):
    errors.append("obsolete player-proxy entity functions remain")

fire = json.loads((ROOT / "data/tfmini/predicate/fire_held.json").read_text(encoding="utf-8")) if (ROOT / "data/tfmini/predicate/fire_held.json").exists() else {}
if fire.get("type") != "minecraft:entity_properties" or fire.get("predicate", {}).get("minecraft:type_specific/player", {}).get("input", {}).get("sprint") is not True:
    errors.append("fire_held.json does not use the 26.2+ player input predicate")

if errors:
    print("FAIL")
    print("\n".join(f"- {item}" for item in errors))
    raise SystemExit(1)
print("PASS: JSON, metadata, structure, function references, objective declarations/initialization, and basic command hazards")
