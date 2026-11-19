tag @s add tfmini_match_participant
tag @s add tfmini_match_register
scoreboard players add @s tf_g_kills 0
scoreboard players add @s tf_deaths 0
scoreboard players operation @s tf_g_base_k = @s tf_g_kills
scoreboard players operation @s tf_g_base_d = @s tf_deaths
scoreboard players set @s tf_g_round_k 0
scoreboard players set @s tf_g_round_d 0
scoreboard players set @s tf_g_ff 0
scoreboard players set @s tf_g_team 1
scoreboard players set @s tf_g_participant 1
function tfmini:game/reset_player
execute at @s summon minecraft:marker run function tfmini:game/roster_init
tag @s remove tfmini_match_register
