execute if score @s tf_ray_type matches 1 run function tfmini:damage/minigun_red
execute if score @s tf_ray_type matches 2 run function tfmini:damage/sniper_red
tag @a[tag=tfmini_ray_target] remove tfmini_ray_target
scoreboard players set @s tf_ray_hit 1
