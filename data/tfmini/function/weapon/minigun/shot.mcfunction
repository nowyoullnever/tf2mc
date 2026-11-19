scoreboard players remove @s tf_mg_ammo 1
scoreboard players set @s tf_mg_cd 2
scoreboard players set @s tf_fire 1
tag @s add tfmini_ray_source
execute if score @s tf_move matches 0 run execute store result score @s tf_ray_damage run random value 0..4
execute if score @s tf_move matches 0 run execute store result score @s tf_spread_y run random value 0..4
execute if score @s tf_move matches 0 run function tfmini:ray/spread/minigun_stationary
execute if score @s tf_move matches 1.. run execute store result score @s tf_ray_damage run random value 0..8
execute if score @s tf_move matches 1.. run execute store result score @s tf_spread_y run random value 0..8
execute if score @s tf_move matches 1.. run function tfmini:ray/spread/minigun_moving
tag @s remove tfmini_ray_source
execute if score @s tf_mg_ammo matches 0 run scoreboard players set @s tf_mg_reload 60
playsound minecraft:entity.blaze.shoot player @s ~ ~ ~ 0.35 1.8
particle minecraft:crit ~ ~1.55 ~ 0.08 0.08 0.08 0.01 2 force @s
