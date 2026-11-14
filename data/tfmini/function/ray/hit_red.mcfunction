execute if entity @e[type=minecraft:interaction,tag=tfmini_head,distance=..0.33,limit=1] run scoreboard players set @s tf_ray_head 1
execute if score @s tf_ray_type matches 1 run function tfmini:damage/minigun_red
execute if score @s tf_ray_type matches 2 run function tfmini:damage/sniper_red
scoreboard players set @s tf_ray_hit 1
