scoreboard players add @s tf_g_kills 0
scoreboard players add @s tf_deaths 0
scoreboard players operation @s tf_g_round_k = @s tf_g_kills
scoreboard players operation @s tf_g_round_k -= @s tf_g_base_k
scoreboard players operation @s tf_g_round_d = @s tf_deaths
scoreboard players operation @s tf_g_round_d -= @s tf_g_base_d
scoreboard players operation #sync_id tf_player_id = @s tf_player_id
scoreboard players operation #sync_k tf_g_round_k = @s tf_g_round_k
scoreboard players operation #sync_d tf_g_round_d = @s tf_g_round_d
execute as @e[type=minecraft:marker,tag=tfmini_match_roster] if score @s tf_owner = #sync_id tf_player_id run function tfmini:game/sync_roster
