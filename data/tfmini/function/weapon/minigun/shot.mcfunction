scoreboard players remove @s tf_mg_ammo 1
scoreboard players set @s tf_mg_cd 4
scoreboard players set @s tf_fire 1
tag @s add tfmini_ray_source
execute store result score @s tf_ray_damage run random value 0..4
execute if score @s tf_ray_damage matches 0 run function tfmini:ray/spread/m2
execute if score @s tf_ray_damage matches 1 run function tfmini:ray/spread/m1
execute if score @s tf_ray_damage matches 2 run function tfmini:ray/spread/z
execute if score @s tf_ray_damage matches 3 run function tfmini:ray/spread/p1
execute if score @s tf_ray_damage matches 4 run function tfmini:ray/spread/p2
tag @s remove tfmini_ray_source
execute if score @s tf_mg_ammo matches 0 run scoreboard players set @s tf_mg_reload 60
playsound minecraft:entity.blaze.shoot player @s ~ ~ ~ 0.35 1.8
particle minecraft:crit ~ ~1.55 ~ 0.08 0.08 0.08 0.01 2 force @s
