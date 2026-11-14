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
