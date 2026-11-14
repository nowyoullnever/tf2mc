scoreboard players add @s tf_ray_step 1
execute unless block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:ray/collision
execute if score @s tf_ray_hit matches 0 if entity @a[team=RED,gamemode=!spectator,distance=..0.48,sort=nearest,limit=1] run function tfmini:ray/hit_red
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_step matches ..400 positioned ^ ^ ^0.25 run function tfmini:ray/blu
