# TF Mini Weapons

Minecraft Java Edition **26.3**, 데이터팩 형식 **121.0**용 서버 전용 4종 무기 데이터팩이다. 리소스팩·모드·플러그인은 필요하지 않다.

## 설치

1. `tf-mini-weapons-1.0.5.zip`을 월드의 `datapacks` 폴더에 압축을 풀지 않고 넣는다.
2. 싱글플레이에서는 월드를 다시 열거나 `/reload`를 실행한다. Realms에서는 월드를 내려받아 `datapacks`에 넣은 뒤 월드를 다시 업로드한다.
3. 채팅에 `[TF Mini] loaded`가 표시되는지 확인한다.
4. 관리자는 `/team join RED <player>` 또는 `/team join BLU <player>`로 참가자를 배정한다.
5. 각 플레이어는 `/function tfmini:give/all`을 실행한다. 개별 지급은 `tfmini:give/minigun`, `sniper`, `rocket`, `medic`이다.

## 조작

- 설정 → 조작 → **질주(Sprint)**를 `F`로 재지정하고, 가능한 경우 **누르고 있는 동안**으로 설정한다.
- `F`를 누른 채 주무기(주 손)로 발사/치유한다. 보조 손 아이템은 작동하지 않는다.
- 스나이퍼는 우클릭으로 망원경을 사용하여 조준·충전하며, 별도로 `F`를 누르면 발사한다.
- `F`와 보조 손 교체 키가 충돌하면 보조 손 교체 키를 다른 키로 옮긴다.

## 관리

- `/function tfmini:admin/reset` — 이 팩이 만든 로켓과 헤드 히트박스만 제거한다.
- `/function tfmini:admin/debug_on`, `/function tfmini:admin/debug_off` — 실행자 개인의 상태 출력.

## 싱글플레이 더미와 측정

- `/function tfmini:test/spawn_red`, `/function tfmini:test/spawn_blu` — 실행자의 눈앞 3블록에 정지 RED/BLU 더미를 만든다. 더미 충돌 경로도 이 시점에만 켜진다.
- `/function tfmini:test/status` — 각 더미의 실제 `Health` NBT를 채팅/콘솔에 출력한다.
- `/function tfmini:test/remove_dummies` — 태그된 시험 더미만 제거하고 더미 충돌 경로를 끈다.

더미는 `tfmini_test_dummy` 태그가 있는 villager만 선택한다. 일반 villager는 절대 표적이 아니다. 관측한 Health 감소는 바닐라 피해 무적 시간, armor/effect, `/damage` 규칙의 영향을 받을 수 있다.

## 시각 탄도와 Medi Gun 자가치유

미니건은 광선 4 step(기본 1블록)마다 `crit`, 스나이퍼는 2 step(기본 0.5블록)마다 `end_rod`를 기존 광선 위치에만 표시한다. 서버 운영자는 0이 아닌 양수로 간격을 바꿀 수 있다.

```mcfunction
scoreboard players set #four tf_ray_step 4
scoreboard players set #two tf_ray_step 2
```

Medi Gun을 든 채 F를 누르면 유효한 동료를 우선 4 HP/s로 치유한다. 동료를 찾지 못했을 때만 자신을 평균 2 HP/s로 치유하며, F를 놓으면 즉시 멈춘다.

일반 나무/철 괭이, 망원경, 당근 낚싯대는 `minecraft:custom_data`의 `tfmini.weapon` 식별자가 없으므로 영향을 받지 않는다. 인벤토리 이동·서버 재시작·모루 이름 변경에도 식별자는 유지된다.

## 검증 실행

```powershell
python tools/validate.py
```

오프라인 구조 검사일 뿐 실제 Minecraft 서버 테스트가 아니다. 전체 항목은 [테스트 계획](docs/TEST_PLAN.md)을 따른다.
