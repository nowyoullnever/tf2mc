# 아키텍처

## 실행 순서

`minecraft:load`는 점수판, 팀, 상수를 한 번 이상 선언한다. 매 tick은 신규 플레이어 초기화 → 타이머 감소/장전 완료 → 주 손 태그 무기 판별 → `tfmini:fire_held` 입력 처리 → 스나이퍼 충전 → 로켓 장전·이동 → 임시 헤드 히트박스 정리 순서다.

플레이어마다 탄약·쿨다운·장전·충전 점수를 갖는다. `/reload`는 `tf_init`이 이미 1인 플레이어의 탄약을 재설정하지 않는다. `tf_player_id`는 새 플레이어에게만 증가하는 식별자다.

## 매치 상태와 점수

`#match tf_g_state`가 유일한 전역 상태다: IDLE=0, RUNNING=1, PAUSED=2. `#match tf_g_timer`는 남은 game tick, `tf_g_total`은 시작 때의 총 tick, `tf_g_work`는 검증/나머지 연산용이다. RUNNING tick만 `timer`를 정확히 한 번 감소시킨다. PAUSED/IDLE에서는 combat player tick, rocket marker tick, cooldown/reload, Medic ray가 호출되지 않는다.

`/function tfmini:game/start {minutes:N}` macro는 요청 값을 storage에 받고, 100배 score로 변환해 1–60 정수인지 검사한다. 성공 시 시작 시점 RED/BLU online non-spectator만 participant tag와 `tf_g_team`을 받는다. `tf_g_kills`와 기존 `tf_deaths`의 baseline을 복사해 round K/D를 `current - baseline`으로 산출하므로 lifetime statistic을 reset하지 않는다. `minecraft:playerKillCount` 기반이라 tagged test villager는 player kill에 포함되지 않는다.

participant마다 persistent marker roster가 `tf_owner`(player ID), start team, 현재 round K/D를 복제한다. disconnect 뒤에도 마지막 동기화된 score는 team total에 남는다. online participant 결과는 실제 selector name으로 출력한다. vanilla datapack 명령만으로 offline player의 문자 이름을 score holder/UUID에서 안정적으로 되찾을 수 없으므로, offline row는 `OFFLINE PARTICIPANT #<player_id>`와 K/D로 명시한다.

bossbar `tfmini:match_timer`는 RUNNING/PAUSED 때만 participant에게 보이고, 매 초 macro text로 `MM:SS`를 갱신한다. 기존 actionbar는 건드리지 않는다. active match 중 `/team`을 바꾸면 score account team은 start 당시 `tf_g_team`으로 고정되지만, 현재 무기 target selector의 live RED/BLU membership은 바뀔 수 있다. 관리자가 active match 중 팀을 바꾸지 않는 것을 운영 정책으로 한다.

## 입력과 무기 식별

`fire_held.json`은 26.2 이후의 `minecraft:type_specific/player.input.sprint` 구조를 사용한다. 26.3의 `execute if items entity @s weapon.mainhand ...`에서 문자열 슬롯 대신 슬롯 소스 약식 `weapon.mainhand`를 사용한다.

각 지급 함수는 `minecraft:custom_data={tfmini:{weapon:"..."}}`를 부여한다. 매 tick의 `detect_weapon`은 정확한 아이템 종류와 해당 custom data를 모두 확인한다.

## 광선과 피해

미니건·스나이퍼는 눈 위치에서 0.25 블록씩 진행하는 재귀 함수다. 통과 블록 태그 외 블록 또는 첫 적 플레이어에서 즉시 종료한다. 사수는 짧은 실행 범위의 `tfmini_ray_source` 태그로 식별되므로 한 tick 안의 서로 다른 사격 상태가 점수판에 섞이지 않는다. 충돌 전의 같은 ray step에서만 `ray/tracer`를 호출한다. `tf_tracer_mod = tf_ray_step % #four` 또는 `% #two`로 각각 1블록/0.5블록 간격을 제어하며, 별도 raycast나 투사체 entity는 만들지 않는다.

스나이퍼·Medic·로켓 충돌은 **엔티티를 생성하지 않는다**. 광선의 현재 sample 위치를 플레이어 feet 기준 높이(몸통 0.30/0.70/1.10/1.40, 머리 1.55/1.76)만큼 아래로 옮긴 뒤 `@a[distance=..0.32]`를 검사한다. standing head를 먼저, crouching head(1.25/1.45)를 다음으로, body를 마지막으로 검사한다. 선택된 실제 플레이어에게만 `tfmini_ray_target`을 잠시 부여하고 바로 피해·정리하므로, unrelated entity가 headshot을 바꾸지 않는다. 이전 tick 위치를 보관하는 proxy 자체가 없다.

`#test_mode`가 1 이상인 동안만 이 충돌 뒤에 `type=minecraft:villager,tag=tfmini_test_dummy` 전용 선택자를 평가한다. 더미 전용 태그는 `tfmini_ray_dummy_target`이며, player `@a` 규칙과 일반 villager를 건드리지 않는다. body/head는 같은 feet-height sample을 사용하고, 로켓은 동일한 LOS recursion과 9/6/3 ring을 거쳐 tagged dummy에만 `/damage`를 적용한다.

미니건 `tfmini:minigun`만 `minecraft:bypasses_cooldown` 태그에 추가해 4-tick 연사가 일반 피해 무적 시간에 막히지 않도록 설계했다. 다른 피해 유형의 쿨다운 태그는 바꾸지 않는다.

## 로켓과 치유

로켓은 `execute summon … run`으로 방금 생성된 `minecraft:marker`에 즉시 팀·수명·발사자 ID와 shooter `Rotation`을 기록한다. marker Rotation은 이후 수정하지 않는다. 매 tick의 두 substep은 각각 `execute at @s run tp @s ^ ^ ^0.4`로 marker 자신의 고정 회전과 현재 위치를 사용하므로, 발사 뒤 사수의 카메라를 읽지 않는다. 각 이동·블록·대상 충돌 검사 전에도 `at @s`로 위치를 새로 잡는다. flame/smoke trail과 폭발도 marker의 실제 위치에서만 표시한다.

`tf_owner`에는 발사 시점의 `tf_player_id`를 저장한다. 폭발 피해는 marker의 `tf_owner`와 online player의 `tf_player_id`가 같은 경우에만 해당 player를 `/damage ... by` source로 사용한다. arrow `Owner` NBT와 `execute on origin`에는 의존하지 않는다. 폭발 상태가 설정된 뒤 marker를 제거하므로 중복 폭발하지 않는다. 일반 폭발 명령을 사용하지 않아 지형·화재를 만들지 않는다.

`weapon/rocket/wind/poc`는 별도 native `minecraft:wind_charge` collision experiment다. marker rocket path는 이 함수를 호출하지 않는다. client survival knockback·cleanup·block interaction을 관측해 PASS하기 전에는 wind burst, rocket jump, self-damage balance를 combat에 통합하지 않는다.

Medi Gun은 같은 팀의 첫 조준 대상에만 작동한다. 12 블록(48 step) 한도, 차단 블록 검사, 20 tick 재사용 대기 뒤 `instant_health 1 0` 한 번을 사용한다. 활성 beam은 광선 step의 희소 입자다. 해당 ray가 동료를 얻으면 `tf_md_target=1`이 되어 자가치유를 건너뛴다. 대상이 없을 때만 독립 `tf_md_self` 40-tick timer로 `instant_health 1 0`을 자신에게 적용하므로 평균 2 HP/s이고 같은 tick에 양쪽을 치유하지 않는다.

## 성능 경계

피해 광선은 발사 중인 플레이어에게만, Medic 광선은 F를 누른 Medic에게만 실행된다. player hitbox entity가 0개이므로 기존의 초당 960회 arrow spawn/kill과 클라이언트 화살 artifact를 제거했다. 실제 Realm MSPT는 측정하지 않았으므로 성능 적합성을 주장하지 않는다. 로켓 수명은 100 tick/80 블록이며 각 로켓의 이동은 최대 두 substep이다.
