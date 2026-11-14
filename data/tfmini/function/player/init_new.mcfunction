scoreboard players set @s tf_init 1
scoreboard players add #next_player tf_player_id 1
scoreboard players operation @s tf_player_id = #next_player tf_player_id
scoreboard players set @s tf_mg_ammo 40
scoreboard players set @s tf_sn_ammo 1
scoreboard players set @s tf_rk_ammo 4
