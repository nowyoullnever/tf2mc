# Changelog

## 1.0.4 — 2026-11-14

- Added wall-bounded, existing-ray Minigun (`crit`) and Sniper (`end_rod`) tracers with scoreboard-modulo density controls.
- Added opt-in, tagged RED/BLU stationary villager test dummies; their Health can be read with `tfmini:test/status` and ordinary villagers are excluded.
- Routed test dummy hits through separate hitscan body/head and rocket LOS/9-6-3 damage paths without changing normal PvP selectors.
- Added optional no-teammate Medi Gun self-healing at 4 HP per 40 ticks (2 HP/s average).
- Removed rocket jumping from the project test requirements; no Levitation substitute is implemented.

## 1.0.3 — 2026-11-14

- Removed all player collision arrow/proxy creation and retained only migration cleanup for tagged legacy arrows.
- Rebuilt Minigun, Sniper, Medic, rocket direct impact, and rocket LOS targeting around entity-free feet-height ray sampling.
- Added standing/crouching head sampling and explicit player target tags for same-target headshot damage.

## 1.0.2 — 2026-11-14

- Replaced per-tick, three-tick-retained player collision arrows with six persistent owner-bound probes per player.
- Proxy positions now update for all players before fire input is processed; stale/offline probes are removed.
- Separated rocket reload interruption into the rocket-only `tf_rk_fired` state.
- Added first-death-safe score handling and a three-point rocket muzzle wall check.
- Added static regressions for stale proxy patterns and global reload interruption.

## 1.0.1 — 2026-11-14

- Fixed the official-server parsing failure in rocket substeps and validated the complete pack with the official Java 26.3 dedicated server.
- Initialized deterministic player runtime state, preserved ID allocation across reloads, and added death-state cleanup.
- Replaced feet-radius hits with owner-bound head/body collision probes; added per-weapon ray ranges and 2D spread.
- Rebuilt rocket initialization through `execute summon … run`; incremental reload is now interrupted by firing.
- Recorded then-unverified mechanics accurately; no rocket-jump implementation was supplied.

## 1.0.0 — 2026-11-14

- Initial Java 26.3 / datapack format 121.0 release.
- Added Minigun, Sniper Rifle, Rocket Launcher, Medi Gun, team utilities, debug UI, offline validator, and release packaging instructions.
