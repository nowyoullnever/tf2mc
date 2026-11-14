# Changelog

## 1.0.1 — 2026-11-14

- Fixed the official-server parsing failure in rocket substeps and validated the complete pack with the official Java 26.3 dedicated server.
- Initialized deterministic player runtime state, preserved ID allocation across reloads, and added death-state cleanup.
- Replaced feet-radius hits with owner-bound head/body collision probes; added per-weapon ray ranges and 2D spread.
- Rebuilt rocket initialization through `execute summon … run`; incremental reload is now interrupted by firing.
- Marked unverified/blocked mechanics accurately. Rocket jumping remains BLOCKED rather than using multi-second Levitation.

## 1.0.0 — 2026-11-14

- Initial Java 26.3 / datapack format 121.0 release.
- Added Minigun, Sniper Rifle, Rocket Launcher, Medi Gun, team utilities, debug UI, offline validator, and release packaging instructions.
