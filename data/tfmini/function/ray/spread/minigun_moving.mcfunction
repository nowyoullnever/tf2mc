scoreboard players set @s tf_ray_type 1
execute if score @s tf_ray_damage matches 0 rotated ~-4 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 1 rotated ~-3 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 2 rotated ~-2 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 3 rotated ~-1 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 4 run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 5 rotated ~1 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 6 rotated ~2 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 7 rotated ~3 ~ run function tfmini:ray/spread/v_moving
execute if score @s tf_ray_damage matches 8 rotated ~4 ~ run function tfmini:ray/spread/v_moving
