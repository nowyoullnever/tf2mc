# 1.0.1 검증 기록

## 실제 공식 서버 검증

- 서버: Mojang 공식 Minecraft Java 26.3 dedicated server (`33680f5f2ac32864d6d7cf5e56a705fdb3e05f4c` SHA-1)
- 런타임: Temurin OpenJDK 25.0.5
- 테스트 월드: 로컬 격리 월드. Realm과 기존 사용자 월드는 사용하지 않았다.

### 재현한 기준선 오류

기준 커밋 `f6bab1c`를 서버로 로드하면 다음 오류가 실제로 발생했다.

```
Failed to load function tfmini:weapon/rocket/substep
Whilst parsing command on line 3: Unknown or incomplete command
```

원인은 독립 명령 `unless block ...`였다. `execute unless block ... run function ...`으로 교체했다.

### 수정본 결과

수정본 시작 로드와 RCON `reload`가 모두 완료되었다. 로그에는 `Loaded 1867 advancements` 및 `Reloading!`가 기록되었고, `Failed to load function`, `ERROR`, 데이터팩 파싱 오류는 없었다.

|ID|상태|근거|
|---|---|---|
|T01|PASS|공식 26.3 서버에서 RCON `reload` 완료, 파싱 오류 없음|
|T02|UNVERIFIED|실제 클라이언트 접속으로 신규 플레이어 상태를 관찰하지 못함|
|T03|UNVERIFIED|실제 클라이언트의 반복 reload/재접속 상태 미측정|
|T04–T11|UNVERIFIED|클라이언트 조작·피해 계측 필요|
|T12–T16|UNVERIFIED|투사체 물리·LOS·장전 계측 필요|
|T15|BLOCKED|바닐라 26.3에서 검증된 방향성 플레이어 impulse 경로를 아직 확보하지 못함|
|T17–T19|UNVERIFIED|실제 조준·치유량·벽 차단 계측 필요|
|T20–T22|UNVERIFIED|2–8명 동시 접속 시험 필요|

정적 검사와 서버 파싱은 게임 플레이 PASS가 아니다. 실제 테스트 절차는 `TEST_PLAN.md`를 따른다.

## 1.0.2 후속 검토 수정

|항목|상태|근거|
|---|---|---|
|P0 stale proxy|FIXED (구조)|매 tick spawn/3 tick retention을 제거하고, 입력 전에 모든 persistent proxy를 갱신한다. `/reload` 시 이전 proxy도 제거한다. 실제 이동 사격은 UNVERIFIED.|
|P1 entity rate|FIXED (구조)|6개/player persistent proxy만 유지한다. 8명에서 48개이며 기존 960 spawn/s는 없다. MSPT와 렌더링은 UNVERIFIED.|
|P1 rocket reload|FIXED (정적)|`tf_fire` 의존성을 제거하고 rocket-only `tf_rk_fired`로 바꿨다. 실제 hotbar 전환 시험은 UNVERIFIED.|
|P1 first death|FIXED (정적)|`tf_deaths_seen=0`에서 시작하고 통계 점수가 최초 생성된 뒤에만 mirror를 갱신한다. 실제 사망/재접속은 UNVERIFIED.|
|P1 muzzle clipping|FIXED (구조)|눈 앞 0.25/0.50/0.75 block을 검사해 막힌 경우 앞쪽으로 projectile를 소환하지 않는다. point-blank 폭발 체감은 UNVERIFIED.|

## 1.0.3 visible hitbox arrow 수정

- `tfmini_hitbox`를 만드는 함수와 persistent proxy 함수를 모두 제거했다.
- `load`와 `admin/reset`의 `kill @e[type=minecraft:arrow,tag=tfmini_hitbox]`만 migration cleanup으로 남겼다. 태그 없는 일반 플레이어 화살은 선택하지 않는다.
- 공식 26.3 서버에서 RCON `reload` 뒤 `execute if entity @e[type=minecraft:arrow,tag=tfmini_hitbox] run say stale_tfmini_hitbox`를 실행했다. 응답과 서버 채팅이 비어 있어 잔여 태그 화살은 없었다.
- feet-height collision, head/body 피해, Medic target, rocket LOS는 파서 검증만 통과했다. 실제 클라이언트 combat·2–8인 성능은 UNVERIFIED다.

## 1.0.4 tracer · singleplayer dummy · Medi self-heal

|항목|상태|근거|
|---|---|---|
|V104-01|PASS|`python tools/validate.py .` 구조·참조·objective 검사 통과|
|V104-02|PASS|Mojang 공식 Java 26.3 dedicated server 시작 로드, RCON `reload` 응답 `Reloading!`, 로그상 datapack parse error 없음|
|V104-03|UNVERIFIED|실제 client에서 Minigun/ Sniper tracer가 spread ray, 벽, 충돌 직전까지만 보이는지 미관측|
|V104-04|UNVERIFIED|더미의 body/head 피해, 실제 Health 변화, 피격 무적 시간 상호작용 미관측|
|V104-05|UNVERIFIED|더미 rocket direct/splash/cover/friendly-fire와 2–8인 동시 사격 미관측|
|V104-06|UNVERIFIED|F release, teammate 우선순위, self-heal 평균 2 HP/s를 실제 client에서 미계측|

서버 로딩과 `/reload`은 명령 문법/참조 확인일 뿐 hitscan damage, healing 또는 particle의 게임 플레이 PASS가 아니다.

## 1.1.0 match management · Wind Charge POC

|항목|상태|근거|
|---|---|---|
|V110-01|PASS|`python tools/validate.py .` 구조·match objective·function reference 검사 통과|
|V110-02|PASS|Mojang 공식 Java 26.3 dedicated server start 및 RCON `reload` 완료, parse error 없음|
|V110-03|PASS|RCON에서 state=IDLE 생성, `{minutes:0}` 및 player 없는 `{minutes:5}` start 뒤에도 `#match tf_g_state=0` 유지|
|V110-04|UNVERIFIED|eligible RED/BLU player가 있는 valid start, 6000/12000 tick timer, pause/resume, bossbar, expiry/manual results|
|V110-05|UNVERIFIED|playerKillCount 기반 K/D, damage attribution, disconnected roster, 2–8명 team total|
|V110-06|BLOCKED|real survival client의 native Wind Charge collision/burst/knockback/cleanup proof 없음 — rocket integration을 의도적으로 보류|
|V110-07|BLOCKED|rocket jump, <=1 HP self damage, fall-damage/interactive-block measurement은 V110-06 선행 proof 필요|

## 1.0.5 marker rocket direction fix

|항목|상태|근거|
|---|---|---|
|V105-01|PASS|`python tools/validate.py .` 통과, Mojang 공식 Java 26.3 dedicated server 시작 로드 및 RCON `reload` 응답 `Reloading!`, parse error 없음|
|V105-02|UNVERIFIED|North/South/East/West/up/down 발사 방향, 직진성, 발사 뒤 mouse 이동 무시는 실제 client 관측 필요|
|V105-03|UNVERIFIED|첫 벽/대상 충돌, 단 한 번 폭발, 동시 다발 marker 소유자 독립성은 실제 client 관측 필요|
|V105-04|UNVERIFIED|muzzle 막힘 시 탄약·cooldown·reload 상태 보존은 실제 client 계측 필요|

## 1.1.1-realms 바닐라 피해 변환

|항목|상태|근거|
|---|---|---|
|V111-01|PASS|`python tools/validate.py .` 통과. 세 custom damage registry JSON과 obsolete `bypasses_cooldown` tag가 없고, pack source의 옛 damage-type 식별자를 검사한다.|
|V111-02|PASS|Mojang 공식 Java 26.3 dedicated server를 이 소스로 시작하고 RCON `reload`를 실행했다. `Failed to load function`, `Unknown or incomplete command`, `Error loading`, `Could not load` 로그가 없었다.|
|V111-03|PASS|RCON storage에 `{amount:7.5f}`를 넣은 뒤 두 Sniper macro damage 함수를 실행했다. 함수가 정상 실행되어 소수점 damage 명령 확장 문법을 확인했다. 대상이 없었으므로 Health 변화는 이 항목에서 측정하지 않았다.|
|V111-04|UNVERIFIED|D01–D16: 실제 survival player/dummy Health, armor, Resistance V, damage immunity, friendly-fire, 동시 공격, kill/death attribution을 client에서 측정하지 못했다.|
|V111-05|UNVERIFIED|새 비실험 세계의 실험 설정 경고 부재는 실제 클라이언트 UI로 확인하지 못했다. source 구조상 custom damage registry는 제거됐다.|
|V111-06|UNVERIFIED|승인된 test Realm이 없어 Realms 업로드를 수행하지 못했다.|

V111-01~03은 Realms 또는 gameplay PASS가 아니다. 특히 Minigun은 바닐라 `minecraft:player_attack`의 피해 무적 시간을 우회하지 않으며, 실제 4-tick 명중당 Health 감소와 DPS는 V111-04에서만 판정한다.

## 1.2.0 weapon rebalance · friendly Rocket · Wind Charge

|항목|상태|근거|
|---|---|---|
|V120-01|PASS|`python tools/validate.py .` 통과. 2-tick Minigun, 60/150/120/18 range limits, self splash 분리, vanilla damage type과 Wind trigger/function reference를 구조 검사했다.|
|V120-02|PASS|공식 Java 26.3 server가 공통 Rocket collision/area, scoring, Wind Charge trigger를 `/reload`로 로드했다. reload 뒤 parse 오류가 없다.|
|V120-03|PASS|RCON에서 `minecraft:wind_charge`를 동일 Motion/Tags NBT로 summon하고 Wind enable/disable, team-total 함수를 실행했다. 명령 파싱 및 tagged charge cleanup 경로를 확인했다.|
|V120-04|UNVERIFIED|R01–R24의 survival Health, friendly self 3 HP, owner attribution, team-score subtraction, Minigun effective DPS, ranges, Resistance V, 2–8 player 성능은 client 관측이 없다.|
|V120-05|UNVERIFIED|running Minecraft client가 Windows automation 대상에 없어서 Wind Charge burst, 실제 upward/horizontal movement, extra contact damage, residual entity, environment interaction을 관측하지 못했다.|
|V120-06|UNVERIFIED|새 비실험 world UI와 Realms 업로드는 수행하지 못했다. custom damage registry는 여전히 없다.|

V120-01~03은 rocket jumping 또는 gameplay PASS가 아니다. native Wind Charge가 실제 burst를 만들지 않거나 원치 않는 contact/environment effect가 보이면 `/function tfmini:weapon/rocket/wind/disable`로 wind propulsion을 끄고 Rocket damage만 사용할 수 있다.
