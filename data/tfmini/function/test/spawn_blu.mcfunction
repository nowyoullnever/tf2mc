execute positioned ^ ^ ^3 summon minecraft:villager run function tfmini:test/init_blu
scoreboard players set #test_mode tf_debug 1
tellraw @s {"text":"TF Mini BLU test dummy spawned. Use /function tfmini:test/status to read Health.","color":"aqua"}
