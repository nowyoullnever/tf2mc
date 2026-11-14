execute if score @s tf_ray_type matches 1 run function tfmini:damage/minigun_blu
execute if score @s tf_ray_type matches 2 run function tfmini:damage/sniper_blu
execute if score @s tf_ray_type matches 1 if entity @e[tag=tfmini_ray_dummy_target] run function tfmini:damage/minigun_dummy
execute if score @s tf_ray_type matches 2 if entity @e[tag=tfmini_ray_dummy_target] run function tfmini:damage/sniper_dummy
tag @a[tag=tfmini_ray_target] remove tfmini_ray_target
tag @e[tag=tfmini_ray_dummy_target] remove tfmini_ray_dummy_target
scoreboard players set @s tf_ray_hit 1
