# 아키텍처

## 실행 순서

`minecraft:load`는 점수판, 팀, 상수를 한 번 이상 선언한다. 매 tick은 신규 플레이어 초기화 → 타이머 감소/장전 완료 → 주 손 태그 무기 판별 → `tfmini:fire_held` 입력 처리 → 스나이퍼 충전 → 로켓 장전·이동 → 임시 헤드 히트박스 정리 순서다.

플레이어마다 탄약·쿨다운·장전·충전 점수를 갖는다. `/reload`는 `tf_init`이 이미 1인 플레이어의 탄약을 재설정하지 않는다. `tf_player_id`는 새 플레이어에게만 증가하는 식별자다.

## 입력과 무기 식별

`fire_held.json`은 26.2 이후의 `minecraft:type_specific/player.input.sprint` 구조를 사용한다. 26.3의 `execute if items entity @s weapon.mainhand ...`에서 문자열 슬롯 대신 슬롯 소스 약식 `weapon.mainhand`를 사용한다.

각 지급 함수는 `minecraft:custom_data={tfmini:{weapon:"..."}}`를 부여한다. 매 tick의 `detect_weapon`은 정확한 아이템 종류와 해당 custom data를 모두 확인한다.

## 광선과 피해

미니건·스나이퍼는 눈 위치에서 0.25 블록씩 진행하는 재귀 함수다. 통과 블록 태그 외 블록 또는 첫 적 플레이어에서 즉시 종료한다. 사수는 짧은 실행 범위의 `tfmini_ray_source` 태그로 식별되므로 한 tick 안의 서로 다른 사격 상태가 점수판에 섞이지 않는다.

스나이퍼·Medic·로켓 충돌은 각 플레이어의 몸통 4점(y + 0.30/0.70/1.10/1.40)과 머리 2점(y + 1.55/1.76)으로 구성한 짧은 수명의 owner-bound arrow probe를 사용한다. 각 probe의 `Owner` UUID는 생성 플레이어에서 즉시 복사되며, 피해 시 `execute on origin`으로 동일 소유자만 선택한다. probe는 3 tick 뒤 제거된다. 이는 실제 AABB의 비용을 낮춘 근사이며 자세별 정확도는 런타임 검증 대상이다.

미니건 `tfmini:minigun`만 `minecraft:bypasses_cooldown` 태그에 추가해 4-tick 연사가 일반 피해 무적 시간에 막히지 않도록 설계했다. 다른 피해 유형의 쿨다운 태그는 바꾸지 않는다.

## 로켓과 치유

로켓은 `execute summon … run`으로 방금 생성된 무중력 화살에 즉시 소유자·팀·회전·수명을 기록한다. 0.4 블록씩 두 번 이동해 0.8 블록/tick으로 만들며, 폭발 상태가 설정된 뒤 제거되어 중복 이동·피해가 발생하지 않는다. 일반 폭발 명령을 사용하지 않아 지형·화재를 만들지 않는다.

Medi Gun은 같은 팀의 첫 조준 대상에만 작동한다. 12 블록(48 step) 한도, 차단 블록 검사, 20 tick 재사용 대기 뒤 `instant_health 1 0` 한 번을 사용한다. 활성 beam은 광선 step의 희소 입자다.

## 성능 경계

피해 광선은 발사 중인 플레이어에게만, Medic 광선은 F를 누른 Medic에게만 실행된다. 로켓 수명은 100 tick/80 블록이며 각 로켓의 이동은 최대 두 substep이다. 실제 Realm MSPT/프로파일링 수치는 측정하지 않았다.
