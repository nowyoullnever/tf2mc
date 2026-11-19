scoreboard players add @s tf_ray_step 1
execute unless block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:ray/collision
execute if score @s tf_ray_hit matches 0 if block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:ray/tracer
execute if score @s tf_ray_hit matches 0 run function tfmini:ray/target_blu
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_type matches 1 if score @s tf_ray_step matches ..240 positioned ^ ^ ^0.25 run function tfmini:ray/red
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_type matches 2 if score @s tf_ray_step matches ..600 positioned ^ ^ ^0.25 run function tfmini:ray/red
