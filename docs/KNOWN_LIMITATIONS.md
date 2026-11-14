# 알려진 제한과 미검증 사항

- 이 작업 환경에는 공식 Minecraft Java 26.3 서버가 없었다. JSON·참조·패키지 정적 검증만 수행했으며 게임 내 PASS는 없다.
- `fire_held`의 26.2+ 입력 predicate, `execute if items` 슬롯 소스, custom data item predicate, `random value`, `return`, `interaction` 엔티티의 26.3 파서는 실제 서버에서 `/reload`로 반드시 확인해야 한다.
- 헤드 히트박스는 실제 플레이어 머리를 근사한 0.58×0.50 상자다. 웅크림·수영·엘리트라·아주 밀집한 플레이어의 정확도는 검증되지 않았다.
- 로켓의 arrow `Owner` NBT 복사와 `execute on origin` 기반 자기 피해/공중 추진은 런타임 미검증이다. 현재는 지형을 바꾸지 않는 3-tick Levitation impulse를 사용한다. 이는 수직 추진만 제공할 수 있으며, 요구된 모든 방향의 실제 로켓 점프 완료로 주장할 수 없다.
- 현재 로켓 폭발 LOS는 구현되어 있으나 실제 블록·얇은 벽·여러 대상에서 검증되지 않았다.
- Medi Gun의 instant health I 실제 회복량을 26.3에서 계측하지 않았다. 20 tick마다 단 한 번만 적용하도록 중복 pulse는 막았다.
- 플레이어 위치 기반 이동 분산(미니건 ±4°)과 비조준 스나이퍼 ±3°는 구현되지 않았다. 자세별 정밀 spread는 미검증으로 보류했다.
- Realms 업로드, 멀티플레이 동시 2–8명, TPS/MSPT, 피해 무적 시간 태그 상호작용, 킬 귀속은 실제 서버 검증 전 UNVERIFIED다.
