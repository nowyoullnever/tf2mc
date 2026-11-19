scoreboard players set #wind_enabled tf_debug 0
kill @e[type=minecraft:wind_charge,tag=tfmini_rocket_wind]
tellraw @s {"text":"[TF Mini] Rocket Wind Charge propulsion disabled; rocket damage remains enabled.","color":"yellow"}
