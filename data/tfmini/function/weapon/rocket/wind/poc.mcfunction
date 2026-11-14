# Standalone native Wind Charge experiment. It is deliberately not called by
# rocket/explode until a survival-client knockback test has passed.
kill @e[type=minecraft:wind_charge,tag=tfmini_wind_poc]
execute anchored eyes positioned ^ ^ ^1.5 summon minecraft:wind_charge run function tfmini:weapon/rocket/wind/poc_init
tellraw @s {"text":"[TF Mini] Wind POC spawned a native Wind Charge. Verify a real collision, burst, player knockback, and entity cleanup before enabling integration.","color":"yellow"}
