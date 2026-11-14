# 알려진 제한과 미검증 사항

- 공식 Minecraft Java 26.3 dedicated server에서 시작 로드와 RCON `/reload`의 파싱 오류가 없음을 확인했다. 클라이언트가 연결된 전투 테스트는 아직 수행하지 못했다.
- player hitbox arrow는 제거했다. 현 충돌은 feet-height sample(반경 0.32)의 근사다. 웅크림 head sample은 구현했지만 수영·엘리트라·매우 밀집한 플레이어·경계선 명중의 정확도는 UNVERIFIED다.
- `minecraft:using_item` advancement의 실제 이벤트 빈도, F 입력과 망원경 동시 사용, scope lease 타이밍은 실제 클라이언트 검증이 필요하다.
- marker 고정 Rotation, 방향별 0.8 block/tick 직진, 발사 뒤 camera 변경 무시, `tf_owner` 피해 귀속, 얇은 벽 LOS, 여러 대상 중복 방지는 서버 파서만 통과했다. 실제 클라이언트 관측은 UNVERIFIED다.
- Rocket jump은 요구사항에서 제거되었고 구현하지 않는다. Levitation 대체도 없다.
- Medi Gun의 teammate/self `instant_health I` 실제 회복량은 계측 전이다. 구현은 유효 연결 한 건당 20 tick마다 한 pulse, 대상 부재 시 40 tick마다 self pulse로 제한한다.
- test dummy head/body collision, 8–14/14–20 sniper damage, minigun 2 damage, rocket 9/6/3 LOS 및 friendly-fire 차단은 서버 파서만 통과했다. 실제 클라이언트 관측은 UNVERIFIED다.
- dummy `Health`는 실제 entity NBT지만 바닐라 damage immunity, armor/effect과 damage type에 의해 기대한 수치보다 적게 감소할 수 있다.
- Realms, 2–8명 동시 사용, TPS/MSPT, armor/Resistance, minigun damage-cooldown 상호작용, 킬 귀속은 UNVERIFIED다.
- v1.1.0 match의 valid start, pause/resume, timer expiry, `/reload` 중 active state 복구, bossbar visibility, playerKillCount attribution, offline roster, simultaneous participants는 실제 client/multiplayer로 검증하지 못했다. 서버에서는 invalid/no-eligible start가 state=IDLE을 보존하는 경로와 parser만 확인했다.
- `minecraft:wind_charge` POC는 native entity를 생성할 뿐, 실제 collision burst·knockback·entity cleanup·block interaction을 client에서 관측하지 못했다. 따라서 wind burst는 Rocket Launcher에 연결되지 않았고 rocket jumping, 0–1 HP self-damage, fall-damage mitigation은 BLOCKED다.
- POC가 실제 burst를 내더라도 door, trapdoor, button, lever, fence gate, bell 및 fragile decoration의 native interaction은 별도 실험이 필요하다. gamerule을 바꾸거나 map block interaction을 숨기는 fallback은 구현하지 않았다.
