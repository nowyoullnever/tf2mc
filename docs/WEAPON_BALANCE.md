# 무기 밸런스

|무기|현재 값|
|---|---|
|Minigun|성공한 `/damage` 명령당 4 HP, 40발, **2 tick**, reload 60 tick, **60 block**, `minecraft:player_attack`|
|Sniper Rifle|body 7.5–13.5 HP, head **13.5–21 HP**, 1발, reload 30 tick, charge 40 tick, **150 block**, `minecraft:player_attack`|
|Rocket Launcher|4발, 20 tick, rocket당 reload 20 tick, 0.8 block/tick, 0.4×2 substep, 9/6/3 HP, self 3 HP, **120 block**, radius 3, `minecraft:player_explosion`|
|Medi Gun|동료 4 HP/s, 대상 없을 때 self 2 HP/s, **18 block**|

Sniper charge는 0.25 HP 단위로 계산한다. body는 `7.5 + 6 × charge/40`, head는 `13.5 + 7.5 × charge/40`이다. Rocket Launcher는 고정 Rotation marker와 `minecraft:player_explosion` 9/6/3 피해를 사용한다. 같은 팀도 대상이며, 사수는 일반 splash 대신 3 HP를 한 번만 받는다. 사수가 3블록 안이면 native `minecraft:wind_charge`를 impact 위치에 생성하며, `/function tfmini:weapon/rocket/wind/disable`로 propulsion만 끌 수 있다.

Minigun은 전역 `bypasses_cooldown` 변경 없이 바닐라 `minecraft:player_attack`만 사용한다. 따라서 2 tick마다 명령은 실행되지만, 실제 피해는 대상의 바닐라 피해 무적 시간·armor·Resistance에 의해 감소하거나 생략될 수 있다. 이 값의 실제 DPS는 클라이언트 Health 계측 전까지 UNVERIFIED다.
