scoreboard players set @s tf_fire 0
scoreboard players set @s tf_rk_fired 0
scoreboard players set @s tf_move 0
execute store result score @s tf_px run data get entity @s Pos[0] 100
execute store result score @s tf_py run data get entity @s Pos[1] 100
execute store result score @s tf_pz run data get entity @s Pos[2] 100
execute unless score @s tf_px = @s tf_lpx run scoreboard players set @s tf_move 1
execute unless score @s tf_py = @s tf_lpy run scoreboard players set @s tf_move 1
execute unless score @s tf_pz = @s tf_lpz run scoreboard players set @s tf_move 1
scoreboard players operation @s tf_lpx = @s tf_px
scoreboard players operation @s tf_lpy = @s tf_py
scoreboard players operation @s tf_lpz = @s tf_pz
execute if score @s tf_deaths > @s tf_deaths_seen run function tfmini:player/death_reset
execute if score @s tf_deaths > @s tf_deaths_seen run scoreboard players operation @s tf_deaths_seen = @s tf_deaths
execute if score @s tf_mg_cd matches 1.. run scoreboard players remove @s tf_mg_cd 1
execute if score @s tf_sn_cd matches 1.. run scoreboard players remove @s tf_sn_cd 1
execute if score @s tf_rk_cd matches 1.. run scoreboard players remove @s tf_rk_cd 1
execute if score @s tf_md_heal matches 1.. run scoreboard players remove @s tf_md_heal 1
execute if score @s tf_md_self matches 1.. run scoreboard players remove @s tf_md_self 1
execute if score @s tf_mg_reload matches 1 run scoreboard players set @s tf_mg_ammo 40
execute if score @s tf_mg_reload matches 1 run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.6 1.0
execute if score @s tf_mg_reload matches 1.. run scoreboard players remove @s tf_mg_reload 1
execute if score @s tf_sn_reload matches 1 run scoreboard players set @s tf_sn_ammo 1
execute if score @s tf_sn_reload matches 1 run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.6 1.3
execute if score @s tf_sn_reload matches 1.. run scoreboard players remove @s tf_sn_reload 1
function tfmini:player/detect_weapon
