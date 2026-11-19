# 게임 명령 참조

## 매치 관리자

```mcfunction
/function tfmini:game/start {minutes:5}
/function tfmini:game/start {minutes:10}
/function tfmini:game/end
/function tfmini:game/pause
/function tfmini:game/resume
/function tfmini:game/status
```

- `start`는 macro function이다. `minutes`는 1–60의 정수여야 한다.
- 상태는 `#match tf_g_state` 하나만 사용한다: IDLE=0, RUNNING=1, PAUSED=2.
- 게임 tick은 RUNNING에서만 감소한다. PAUSED/IDLE에서는 남은 tick을 바꾸지 않는다.
- match 시작 시 RED/BLU 팀의 online non-spectator만 participant로 등록한다. 팀을 자동 배정하거나 inventory/영구 statistic을 초기화하지 않는다.

## 개발 및 Wind Charge POC

```mcfunction
/function tfmini:test/spawn_red
/function tfmini:test/spawn_blu
/function tfmini:test/status
/function tfmini:test/remove_dummies
/function tfmini:weapon/rocket/wind/poc
/function tfmini:weapon/rocket/wind/debug
/function tfmini:weapon/rocket/wind/cleanup
/function tfmini:weapon/rocket/wind/enable
/function tfmini:weapon/rocket/wind/disable
```

v1.2.0 Rocket Launcher는 사수가 3 block 안일 때 marker impact 위치에서 native `minecraft:wind_charge`를 trigger한다. `disable`은 이 propulsion만 끄고 Rocket damage·self damage·reload·ammo를 유지한다. `wind/poc`는 별도 재현용 experiment다. survival client에서 burst, knockback, cleanup, block interaction은 아직 PASS가 아니다.
