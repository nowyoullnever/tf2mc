scoreboard players add @s tf_ray_step 1
execute unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_ray_hit 1
execute if score @s tf_ray_hit matches 0 run function tfmini:weapon/medic/target_blu
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_step matches ..72 run particle minecraft:happy_villager ~ ~ ~ 0 0 0 0 1 force @a[distance=..32]
execute if score @s tf_ray_hit matches 0 if score @s tf_ray_step matches ..72 positioned ^ ^ ^0.25 run function tfmini:ray/medic_blu_step
