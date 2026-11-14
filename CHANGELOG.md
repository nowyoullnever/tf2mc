# Changelog

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
- Marked unverified/blocked mechanics accurately. Rocket jumping remains BLOCKED rather than using multi-second Levitation.

## 1.0.0 — 2026-11-14

- Initial Java 26.3 / datapack format 121.0 release.
- Added Minigun, Sniper Rifle, Rocket Launcher, Medi Gun, team utilities, debug UI, offline validator, and release packaging instructions.
