scoreboard players set @s tf_ray_head 0
execute as @e[type=minecraft:arrow,tag=tfmini_hit_head,scores={tf_team=1},distance=..0.30,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if entity @e[tag=tfmini_ray_target] run scoreboard players set @s tf_ray_head 1
execute if score @s tf_ray_head matches 0 as @e[type=minecraft:arrow,tag=tfmini_hit_body,scores={tf_team=1},distance=..0.30,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if score @s tf_ray_type matches 1 run function tfmini:damage/minigun_red
execute if score @s tf_ray_type matches 2 run function tfmini:damage/sniper_red
tag @e[tag=tfmini_ray_target] remove tfmini_ray_target
scoreboard players set @s tf_ray_hit 1
