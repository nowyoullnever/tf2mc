scoreboard players set #match tf_g_red 0
scoreboard players set #match tf_g_blu 0
execute as @e[type=minecraft:marker,tag=tfmini_match_roster,scores={tf_g_team=1}] run function tfmini:game/add_red_score
execute as @e[type=minecraft:marker,tag=tfmini_match_roster,scores={tf_g_team=2}] run function tfmini:game/add_blu_score
