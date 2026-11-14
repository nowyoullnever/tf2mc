scoreboard players set #match tf_g_red 0
scoreboard players set #match tf_g_blu 0
execute as @e[type=minecraft:marker,tag=tfmini_match_roster,scores={tf_g_team=1}] run scoreboard players operation #match tf_g_red += @s tf_g_round_k
execute as @e[type=minecraft:marker,tag=tfmini_match_roster,scores={tf_g_team=2}] run scoreboard players operation #match tf_g_blu += @s tf_g_round_k
