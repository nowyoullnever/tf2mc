# 무기 밸런스

|무기|현재 값|
|---|---|
|Minigun|2 HP, 40발, 4 tick, reload 60 tick, 40 block|
|Sniper Rifle|body 8–14 HP, head 14–20 HP, 1발, reload 30 tick, charge 40 tick|
|Rocket Launcher|4발, 20 tick, rocket당 reload 20 tick, 0.8 block/tick, 0.4×2 substep, 9/6/3 HP, radius 3|
|Medi Gun|동료 4 HP/s, 대상 없을 때 self 2 HP/s, 12 block|

Rocket Launcher는 고정 Rotation marker와 custom 9/6/3 damage만 사용한다. native Wind Charge impulse와 rocket jump은 아직 검증되지 않아 연결하지 않았다. 따라서 현재 self custom rocket damage는 기존 marker 구현의 2 HP이며 v1.1.0 acceptance의 0–1 HP self-damage/rocket jump 요구를 충족했다고 주장하지 않는다.
