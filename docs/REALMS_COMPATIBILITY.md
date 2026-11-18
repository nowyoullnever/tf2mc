# Realms 호환성: v1.1.1-realms

## 변경 범위

이 버전은 `data/tfmini/damage_type/`의 세 커스텀 registry 파일과 `data/minecraft/tags/damage_type/bypasses_cooldown.json`을 제거했다. 데이터팩에는 새 custom dynamic registry가 없다. `pack.mcmeta`는 Java 26.3 형식 `[121, 0]`을 유지한다.

무기는 바닐라 타입만 사용한다.

|무기|피해 타입|
|---|---|
|Minigun|`minecraft:player_attack`|
|Sniper Rifle|`minecraft:player_attack`|
|Rocket Launcher|`minecraft:player_explosion`|

어떤 바닐라 damage-type tag도 변경하지 않는다. `generic_kill`도 사용하지 않는다.

## 기존 세계

기존에 실험 설정 경고가 뜬 세계는 그 세계의 metadata가 남아 있을 수 있다. 이 데이터팩은 `level.dat`를 수정하거나 실험 플래그를 제거하지 않는다. 원본 월드를 백업하고, 실험 기능을 끈 새 세계에서 ZIP을 넣은 뒤 경고가 없는지 확인해야 한다.

## 설치 확인

1. 새 Java 26.3 비실험 세계를 만든다.
2. `tf-mini-weapons-1.1.1-realms.zip`을 해당 세계 `datapacks` 폴더에 넣는다.
3. 세계를 열고 `/reload`를 실행한다.
4. `[TF Mini] loaded`와 오류 없는 로그를 확인한다.
5. Realms는 내려받은 복사본에서 위 절차를 마친 뒤에만 업로드한다.

클라이언트의 새 세계 경고 부재와 실제 Realms 업로드는 이 저장소의 자동 검증으로 확인할 수 없다. 별도 실제 환경 테스트가 필요하다.
