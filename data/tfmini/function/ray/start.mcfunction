scoreboard players set @s tf_ray_step 0
scoreboard players set @s tf_ray_hit 0
scoreboard players set @s tf_ray_head 0
execute if score @s tf_ray_type matches 2 if entity @s[team=RED] run function tfmini:ray/red
execute if score @s tf_ray_type matches 2 if entity @s[team=BLU] run function tfmini:ray/blu
execute unless score @s tf_ray_type matches 2 run scoreboard players set @s tf_ray_type 1
execute if score @s tf_ray_type matches 1 if entity @s[team=RED] run function tfmini:ray/red
execute if score @s tf_ray_type matches 1 if entity @s[team=BLU] run function tfmini:ray/blu
