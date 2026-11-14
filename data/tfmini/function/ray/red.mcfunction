scoreboard players add @s tf_ray_step 1
execute unless block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:ray/collision
execute if score @s tf_ray_hit matches 0 if entity @e[type=minecraft:arrow,tag=tfmini_hit_head,scores={tf_team=2},distance=..0.30,sort=nearest,limit=1] run function tfmini:ray/hit_blu
execute if score @s tf_ray_hit matches 0 if entity @e[type=minecraft:arrow,tag=tfmini_hit_body,scores={tf_team=2},distance=..0.30,sort=nearest,limit=1] run function tfmini:ray/hit_blu
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_type matches 1 if score @s tf_ray_step matches ..160 positioned ^ ^ ^0.25 run function tfmini:ray/red
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_type matches 2 if score @s tf_ray_step matches ..400 positioned ^ ^ ^0.25 run function tfmini:ray/red
