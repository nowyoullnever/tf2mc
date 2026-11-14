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
```

`wind/poc`는 충돌을 유도하는 native `minecraft:wind_charge`를 생성한다. 이것은 wind burst 구현 증명이 아니다. survival client에서 실제 burst, knockback, cleanup을 관측한 뒤에만 Rocket Launcher 연결을 검토한다.
