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
