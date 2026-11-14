# Native Wind Charge · Rocket Jump 검증 절차

상태: **BLOCKED — survival client observation 필요**. 아래가 직접 PASS 되기 전에는 `wind/poc`를 Rocket Launcher에 연결하지 않는다.

1. survival 모드에서 평평한 stone floor 위에 선다.
2. `/function tfmini:weapon/rocket/wind/poc` 실행 뒤 charge가 solid block에 실제 충돌하는지 관측한다.
3. native wind burst가 한 번 발생하고 근처 플레이어가 실제 속도로 밀려나는지 영상과 위치/높이 측정으로 기록한다.
4. 남은 `tfmini_wind_poc` entity가 없는지 `/function tfmini:weapon/rocket/wind/debug`로 확인한다.
5. floor, wall, player-nearby에서 각각 실행해 수직/수평 displacement, Health 손실, 착지 후 fall damage, door/trapdoor/button/lever/fence gate/bell 상호작용을 기록한다.
6. `minecraft:wind_charge`와 `minecraft:breeze_wind_charge`를 같은 것으로 취급하지 않는다. breeze variant는 별도 검증 없이는 사용하지 않는다.
7. POC가 PASS 된 뒤에만 marker explosion의 impact location에 native burst를 연결하고 9/6/3 custom damage가 중복되지 않는지 재시험한다.
