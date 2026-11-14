# 무기 수치

|무기|탄창/장전|발사|피해/거리|
|---|---|---|---|
|Minigun|40발, 60 tick 자동 장전|4 tick|2 HP, 40 블록, 정지 ±2°/이동 ±4° 2축 분산|
|Sniper Rifle|1발, 30 tick|30 tick|몸 8–14, 머리 14–20, 100 블록, 최대 충전 40 tick, 비조준 ±3°|
|Rocket Launcher|4발, 20 tick씩 1발 장전|20 tick|0.8 block/tick, 반경 3, 9/6/3 HP|
|Medi Gun|없음|연속|12 블록, 20 tick마다 instant health I 1회|

피해값은 Minecraft의 `/damage` 수치(HP)다. 방어구·저항·상태 이상은 일반 Minecraft 피해 규칙에 따른다.

미니건 이동은 매 tick 플레이어의 실제 위치를 1/100 블록 점수로 비교해 판단한다. Sprint 입력은 movement detector로 사용하지 않는다. 분산·충돌 결과는 실제 클라이언트 전투에서 계측 전이므로 UNVERIFIED다.
