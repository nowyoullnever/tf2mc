tellraw @s {"text":"TF Mini dummy Health follows actual entity Health; vanilla damage immunity, armor/effects, and /damage rules can change observed loss.","color":"yellow"}
execute as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED] run data get entity @s Health
execute as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=BLU] run data get entity @s Health
