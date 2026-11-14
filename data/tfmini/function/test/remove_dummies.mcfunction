kill @e[type=minecraft:villager,tag=tfmini_test_dummy]
scoreboard players set #test_mode tf_debug 0
tellraw @s {"text":"TF Mini test dummies removed; dummy collision path disabled.","color":"yellow"}
