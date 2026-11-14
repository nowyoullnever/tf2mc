scoreboard players set @s tf_ray_type 1
execute if score @s tf_ray_damage matches 0 rotated ~-2 ~ run function tfmini:ray/spread/v_stationary
execute if score @s tf_ray_damage matches 1 rotated ~-1 ~ run function tfmini:ray/spread/v_stationary
execute if score @s tf_ray_damage matches 2 run function tfmini:ray/spread/v_stationary
execute if score @s tf_ray_damage matches 3 rotated ~1 ~ run function tfmini:ray/spread/v_stationary
execute if score @s tf_ray_damage matches 4 rotated ~2 ~ run function tfmini:ray/spread/v_stationary
