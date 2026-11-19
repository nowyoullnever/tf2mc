tag @s add tfmini_match_roster
scoreboard players operation @s tf_owner = @a[tag=tfmini_match_register,limit=1] tf_player_id
scoreboard players operation @s tf_g_team = @a[tag=tfmini_match_register,limit=1] tf_g_team
scoreboard players set @s tf_g_round_k 0
scoreboard players set @s tf_g_round_d 0
scoreboard players set @s tf_g_ff 0
