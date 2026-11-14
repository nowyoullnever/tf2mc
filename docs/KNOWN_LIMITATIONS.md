# 알려진 제한과 미검증 사항

- 공식 Minecraft Java 26.3 dedicated server에서 시작 로드와 RCON `/reload`의 파싱 오류가 없음을 확인했다. 클라이언트가 연결된 전투 테스트는 아직 수행하지 못했다.
- player hitbox arrow는 제거했다. 현 충돌은 feet-height sample(반경 0.32)의 근사다. 웅크림 head sample은 구현했지만 수영·엘리트라·매우 밀집한 플레이어·경계선 명중의 정확도는 UNVERIFIED다.
- `minecraft:using_item` advancement의 실제 이벤트 빈도, F 입력과 망원경 동시 사용, scope lease 타이밍은 실제 클라이언트 검증이 필요하다.
- 로켓의 Owner 복사, `execute on origin` 피해 귀속, 얇은 벽 LOS, 여러 대상 중복 방지와 타격 물리는 서버 파서는 통과했지만 런타임 UNVERIFIED다.
- Rocket jump은 BLOCKED다. 다초 Levitation 대체는 제거했으며, 검증된 방향성·순간 player impulse를 아직 찾지 못했다.
- Medi Gun의 instant health I 실제 회복량은 계측 전이다. 구현은 유효 연결 한 건당 20 tick마다 한 pulse로 제한한다.
- Realms, 2–8명 동시 사용, TPS/MSPT, armor/Resistance, minigun damage-cooldown 상호작용, 킬 귀속은 UNVERIFIED다.
