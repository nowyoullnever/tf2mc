# 테스트 계획 및 결과

상태 규칙: **PASS**는 실제 Minecraft Java 26.3에서 관찰된 경우만 사용한다. 1.0.1은 공식 서버에서 시작 로드와 RCON `/reload`를 PASS로 확인했다. 클라이언트 전투 항목은 UNVERIFIED 또는 BLOCKED다. 상세 로그는 `VALIDATION.md`를 본다.

|ID|상태|검사 방법|
|---|---|---|
|A01|PASS|공식 26.3 dedicated server가 월드의 데이터팩을 자동 로드|
|A02|PASS|공식 26.3 dedicated server에서 RCON `/reload` 완료, 파싱 오류 없음|
|A03|UNVERIFIED|F 홀드 중 `tf_fire`와 탄약 감소 관찰|
|A04|UNVERIFIED|F 해제 직후 탄약 감소가 멈추는지 확인|
|A05|UNVERIFIED|태그 없는 4개 바닐라 아이템이 작동하지 않는지 확인|
|A06|UNVERIFIED|미니건 한 발마다 4 tick 간격인지 기록|
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
|A20|BLOCKED|현재 Levitation impulse는 전방/측면 실제 로켓 점프를 보장하지 않는다. 바닐라 물리 검증과 대체 impulse가 필요하다.|
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

## 권장 실제 테스트 순서

1. 테스트 월드 복사본에서 설치하고 `/reload`를 실행한다.
2. RED와 BLU 각각 1명씩 배정하고 무기를 지급한다.
3. A03–A19를 순서대로 수행한다. 서버 로그와 화면 녹화로 tick 수를 기록한다.
4. 4명이 동시에 20초간 미니건·로켓을 사용한 뒤 `/function tfmini:admin/reset` 전후의 `@e[tag=tfmini_rocket]` 수를 비교한다.
5. A20은 실제 수직·수평 이동을 별도 측정한다. 실패하면 이 ZIP을 운영 Realm에 올리지 않는다.
