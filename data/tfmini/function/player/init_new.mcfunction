scoreboard players set @s tf_init 1
scoreboard players add #next_player tf_player_id 1
scoreboard players operation @s tf_player_id = #next_player tf_player_id
scoreboard players set @s tf_mg_ammo 40
scoreboard players set @s tf_sn_ammo 1
scoreboard players set @s tf_rk_ammo 4
scoreboard players set @s tf_weapon 0
scoreboard players set @s tf_mg_cd 0
scoreboard players set @s tf_mg_reload 0
scoreboard players set @s tf_sn_cd 0
scoreboard players set @s tf_sn_reload 0
scoreboard players set @s tf_sn_charge 0
scoreboard players set @s tf_sn_scope 0
scoreboard players set @s tf_sn_use 0
scoreboard players set @s tf_rk_cd 0
scoreboard players set @s tf_rk_reload 0
scoreboard players set @s tf_rk_fired 0
scoreboard players set @s tf_rk_muzzle 0
scoreboard players set @s tf_md_heal 0
scoreboard players set @s tf_fire 0
scoreboard players set @s tf_debug 0
scoreboard players set @s tf_ray_step 0
scoreboard players set @s tf_ray_hit 0
scoreboard players set @s tf_ray_type 0
scoreboard players set @s tf_ray_damage 0
scoreboard players set @s tf_ray_head 0
scoreboard players set @s tf_alive 1
# Statistics can be absent until their first event. Start the mirror at an
# explicit zero; the first generated death score then triggers exactly once.
scoreboard players set @s tf_deaths_seen 0
scoreboard players set @s tf_move 0
scoreboard players set @s tf_px 0
scoreboard players set @s tf_py 0
scoreboard players set @s tf_pz 0
scoreboard players set @s tf_lpx 0
scoreboard players set @s tf_lpy 0
scoreboard players set @s tf_lpz 0
scoreboard players set @s tf_spread_y 0
execute store result score @s tf_lpx run data get entity @s Pos[0] 100
execute store result score @s tf_lpy run data get entity @s Pos[1] 100
execute store result score @s tf_lpz run data get entity @s Pos[2] 100
scoreboard players operation @s tf_px = @s tf_lpx
scoreboard players operation @s tf_py = @s tf_lpy
scoreboard players operation @s tf_pz = @s tf_lpz
