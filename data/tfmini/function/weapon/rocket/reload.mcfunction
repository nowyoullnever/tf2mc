execute if score @s tf_fire matches 1 run scoreboard players set @s tf_rk_reload 0
execute if score @s tf_rk_ammo matches ..3 if score @s tf_fire matches 0 if score @s tf_rk_reload matches 0 run scoreboard players set @s tf_rk_reload 20
execute if score @s tf_rk_reload matches 1 run scoreboard players add @s tf_rk_ammo 1
execute if score @s tf_rk_reload matches 1 run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.45 0.8
execute if score @s tf_rk_reload matches 1.. run scoreboard players remove @s tf_rk_reload 1
execute if score @s tf_rk_ammo matches 4.. run scoreboard players set @s tf_rk_ammo 4
