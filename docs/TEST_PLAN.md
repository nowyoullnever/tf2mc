# 테스트 계획 및 결과

상태 규칙: **PASS**는 실제 Minecraft Java 26.3에서 관찰된 경우만 사용한다. 1.0.1은 공식 서버에서 시작 로드와 RCON `/reload`를 PASS로 확인했다. 클라이언트 전투 항목은 UNVERIFIED 또는 BLOCKED다. 상세 로그는 `VALIDATION.md`를 본다.

|ID|상태|검사 방법|
|---|---|---|
|A01|PASS|공식 26.3 dedicated server가 월드의 데이터팩을 자동 로드|
|A02|PASS|공식 26.3 dedicated server에서 RCON `/reload` 완료, 파싱 오류 없음|
|A03|UNVERIFIED|F 홀드 중 `tf_fire`와 탄약 감소 관찰|
|A04|UNVERIFIED|F 해제 직후 탄약 감소가 멈추는지 확인|
|A05|UNVERIFIED|태그 없는 4개 바닐라 아이템이 작동하지 않는지 확인|
|A06|UNVERIFIED|미니건 한 발마다 2 tick 간격인지 기록|
|A07|UNVERIFIED|40발 뒤 정지하는지 확인|
|A08|UNVERIFIED|빈 탄창부터 정확히 60 tick 후 40발인지 확인|
|A09|UNVERIFIED|5단계 spread가 실제 탄착점에 반영되는지 확인|
|A10|UNVERIFIED|고정 표적 연사와 근접 공격을 섞어 피해 쿨다운 상호작용 측정|
|A11|UNVERIFIED|스나이퍼가 한 발을 소비하는지 확인|
|A12|UNVERIFIED|태그된 망원경 우클릭이 기본 확대를 유지하는지 확인|
|A13|UNVERIFIED|실제 사용 중에만 charge가 1/tick 증가하는지 확인|
|A14|UNVERIFIED|머리와 몸통 표적의 피해가 다른지 확인|
|A15|UNVERIFIED|스나이퍼 장전이 정확히 30 tick인지 확인|
|A16|UNVERIFIED|로켓 탄창이 4발인지 확인|
|A17|UNVERIFIED|로켓이 0.8 block/tick 이동하고 벽에서 충돌하는지 확인|
|A18|UNVERIFIED|로켓 충돌에 블록/불/지형 변경이 없는지 확인|
|A19|UNVERIFIED|거리 1/2/3에서 9/6/3 피해와 LOS 차단 확인|
|A21|UNVERIFIED|탄창 0–3에서 F 해제 후 20 tick마다 한 발이 추가되는지 확인|
|A22|UNVERIFIED|동료 대상 치유량과 20 tick pulse 확인|
|A23|UNVERIFIED|적/자신/벽/12블록 밖에서 치유되지 않는지 확인|
|A24|UNVERIFIED|RED/BLU 아군 피해 차단과 적 피해 확인|
|A25|UNVERIFIED|두 플레이어가 동일 무기로 독립 탄약·쿨다운을 갖는지 확인|
|A26|UNVERIFIED|무기 교체로 탄약이 재설정되지 않는지 확인|
|A27|UNVERIFIED|사망·재접속 뒤 상태가 손상되지 않는지 확인|
|A28|UNVERIFIED|비행 로켓 만료와 `admin/reset` cleanup 확인|
|A29|UNVERIFIED|`debug_on/off`, `admin/reset` 실행 확인|
|A30|UNVERIFIED|리소스팩/클라이언트 모드 없이 Realms 접속 확인|
|A31|UNVERIFIED|Minigun tracer가 4 ray step마다 보이고 solid wall 뒤에 particle이 없는지 확인|
|A32|UNVERIFIED|Sniper tracer가 2 ray step마다 보이고 실제 spread 방향을 따르는지 확인|
|A33|UNVERIFIED|RED/BLU test dummy를 만들고 `status`의 실제 Health가 body/head shot 뒤에 변하는지 확인|
|A34|UNVERIFIED|dummy rocket direct/splash 9/6/3과 solid-cover 차단을 Health로 확인|
|A35|UNVERIFIED|동료 dummy가 Minigun/Sniper/Rocket 피해를 받지 않는지 확인|
|A36|UNVERIFIED|Medi Gun F hold/release 및 teammate 우선·self-only 2 HP/s를 확인|
|A37|UNVERIFIED|North/South/East/West/up/down 각각으로 rocket을 발사해 crosshair 방향, 0.8 block/tick 직진, 고정 Rotation을 확인|
|A38|UNVERIFIED|발사 직후 mouse를 반대 방향으로 움직여도 marker trajectory가 바뀌지 않는지 확인|
|A39|UNVERIFIED|벽/유효 대상 첫 충돌에서만 폭발하고, 여러 동시 rocket의 방향·owner가 서로 섞이지 않는지 확인|
|A40|UNVERIFIED|muzzle 0.25/0.50/0.75 block을 막아도 ammo가 줄지 않고 cooldown/reload interruption이 생기지 않는지 확인|
|M01|UNVERIFIED|`start {minutes:5}` 뒤 6000 tick 설정|
|M02|UNVERIFIED|`start {minutes:10}` 뒤 12000 tick 설정|
|M03–M05|PARTIAL|0분·무참가·active match start 거부는 일부 server state 검사만 수행; 실제 admin chat/client는 미관측|
|M06–M10|UNVERIFIED|pause/resume, reload, timer expiry, manual end, results once|
|M11–M18|UNVERIFIED|player K/D, dummy 제외, disconnect roster, draw/winner, paused combat freeze|
|W01–W22|BLOCKED|native Wind Charge POC의 survival collision/knockback proof가 없어 rocket integration 전부 보류|

## 권장 실제 테스트 순서

1. 테스트 월드 복사본에서 설치하고 `/reload`를 실행한다.
2. RED와 BLU 각각 1명씩 배정하고 무기를 지급한다.
3. A03–A19를 순서대로 수행한다. 서버 로그와 화면 녹화로 tick 수를 기록한다.
4. 4명이 동시에 20초간 미니건·로켓을 사용한 뒤 `/function tfmini:admin/reset` 전후의 `@e[tag=tfmini_rocket]` 수를 비교한다.
5. rocket jump은 시험 범위가 아니다. Levitation 또는 대체 movement effect를 시험하지 않는다.

## Marker 로켓 방향 시험

1. 빈 테스트 월드에서 RED 또는 BLU 팀으로 참가하고 Rocket Launcher를 지급한다. 각 방향을 향해 F를 한 번만 누르고 projectile trail을 기록한다.
2. North, South, East, West, straight up, straight down 각각에서 crosshair 방향과 같은 직선으로 이동하는지 확인한다. 발사 직후 mouse를 반대 방향으로 움직여도 궤도가 변하면 FAIL이다.
3. 각 방향에서 벽과 enemy dummy를 따로 배치한다. 첫 solid block 또는 유효 target에서만 한 번 폭발해야 한다.
4. 두 플레이어가 서로 다른 방향으로 동시에 발사한다. marker trail, 피해 귀속, RED/BLU friendly-fire 차단이 독립적인지 확인한다.

## v1.1.1 Realms · 바닐라 피해 측정

모든 피해 수치는 survival 모드 대상의 실제 `Health` NBT 또는 관찰 가능한 체력 바로 기록한다. 한 번의 명중 뒤에는 바닐라 피해 무적 시간이 끝날 때까지 기다린다. armor, Resistance, enchantment는 별도 조건으로 기록한다.

|ID|절차|기대값|상태|
|---|---|---|---|
|D01|무방어 BLU 더미 몸통에 Minigun을 한 번만 명중|명령 기준 4 HP|UNVERIFIED|
|D02|2 tick 간격 Minigun 연사 후 Health를 매 hit 기록|바닐라 무적 시간으로 실제 DPS 확인|UNVERIFIED|
|D03|armor 대상에 D01 반복|armor 감소가 적용됨|UNVERIFIED|
|D04|Resistance V 대상에 D01 반복|0 HP|UNVERIFIED|
|D05/D06|Sniper body, charge 0/40|7.5 / 13.5 HP|UNVERIFIED|
|D07/D08|Sniper head, charge 0/40|13.5 / 21 HP|UNVERIFIED|
|D09/D10/D11|Rocket 착탄점에서 0–1/1–2/2–3 block|9 / 6 / 3 HP|UNVERIFIED|
|D12|발사자만 rocket 폭발 범위에 둠|datapack self damage 3 HP|UNVERIFIED|
|D13|같은 팀 player/dummy에 세 무기 사용|custom damage 0 HP|UNVERIFIED|
|D14|Resistance V 대상에 세 무기 사용|0 HP|UNVERIFIED|
|D15|각 무기로 적 player 처치|사수 kill·대상 death만 1 증가|UNVERIFIED|
|D16|둘 이상이 동시에 같은 대상을 공격|중복/오귀속 없음|UNVERIFIED|

새 비실험 Java 26.3 세계에서는 ZIP을 넣고 세계를 다시 연다. 실험 설정 경고가 없는지 클라이언트 화면에서 확인한 뒤 `/reload`를 실행한다. Realms 업로드는 승인된 시험 Realm에서만 수행하며 기존 사용자 월드는 사용하거나 덮어쓰지 않는다.

## v1.2.0 rebalance · rocket friendly fire · Wind Charge

|ID|절차|기대값|상태|
|---|---|---|---|
|R01–R03|RED/BLU rocket으로 enemy 및 teammate를 각각 0–1 block에서 명중|각 9 HP before mitigation|UNVERIFIED|
|R04–R06|사수의 0–3/3+ block self splash|3 HP 한 번 / 0 HP|UNVERIFIED|
|R07/R08|ground/wall impact를 사수 3 block 안에서 발생|실제 native vertical/horizontal wind impulse|UNVERIFIED|
|R09|R07에서 Health를 실제 NBT로 전후 기록|총 direct self damage 3 HP target, extra native contact damage 없음|UNVERIFIED|
|R10|동시 2개 이상 rocket|owner, self 3 HP, explosion 한 번, cleanup 독립|UNVERIFIED|
|R11|Minigun 40 shots 입력 tick 기록|2 tick interval, 약 4초 magazine empty|UNVERIFIED|
|R12–R15|Minigun/Sniper/Rocket/Medi 최대거리|60/150/120/18 block|UNVERIFIED|
|R16–R19|Sniper charge 0/40 body/head Health|7.5/13.5 body, 13.5/21 head|UNVERIFIED|
|R20|friendly rocket kill 뒤 match total과 personal K/D|personal vanilla K/D 기록, team point +0|UNVERIFIED|
|R21/R22|Minigun/Sniper friendly fire 및 Resistance V|0 HP / 모든 무기 0 HP|UNVERIFIED|
|R23|door, trapdoor, button, lever, fence gate, bell, decoration 근처 wind burst|실제 환경 상호작용 기록|UNVERIFIED|
|R24|2/4/8 player 동시 사격|attribution, state, MSPT/TPS 기록|UNVERIFIED|

Wind propulsion만 끄려면 `/function tfmini:weapon/rocket/wind/disable`, 다시 켜려면 `/function tfmini:weapon/rocket/wind/enable`을 사용한다. 두 명령은 Rocket damage, ammunition, reload를 바꾸지 않는다.
5. 0.25, 0.50, 0.75 block 위치를 solid block으로 막고 F를 누른다. `tf_rk_ammo`, `tf_rk_cd`, `tf_rk_reload`가 발사 전 상태와 같아야 한다.

## 더미 단독 시험 명령

1. `/team join RED <내이름>` 후 `/function tfmini:give/all`, `/function tfmini:test/spawn_blu`를 실행한다. 이후 매 시도 전후 `/function tfmini:test/status`를 실행한다.
2. 미니건 body: BLU dummy 몸통을 조준해 F를 짧게 누른다. 첫 유효 hit는 2 HP를 목표로 한다. 연사 관측은 바닐라 피해 무적 시간과 minigun damage type을 함께 기록한다.
3. 스나이퍼 uncharged body: scope 없이 BLU dummy 몸통을 조준해 F를 누른다. 8 HP를 목표로 한다.
4. 스나이퍼 full-charge body/head: scope를 유지해 charge가 14가 된 뒤 각각 몸통과 머리에 F를 누른다. body 14 HP, head 20 HP를 목표로 한다.
5. 로켓: 가까운 BLU dummy 정면에 direct impact를 만들고, 이어 1/2/3 block ring의 splash를 각각 시험한다. solid block을 사이에 둔 경우 Health가 변하지 않아야 한다.
6. `/function tfmini:test/spawn_red`도 실행한 뒤 RED 팀으로 든 모든 무기로 RED dummy를 조준한다. Health가 변하지 않아야 한다. 끝나면 `/function tfmini:test/remove_dummies`를 실행한다.
