scoreboard players set @s tf_ray_type 2
execute if score @s tf_ray_head matches 0 rotated ~-3 ~ run function tfmini:ray/spread/v_sniper
execute if score @s tf_ray_head matches 1 rotated ~-2 ~ run function tfmini:ray/spread/v_sniper
execute if score @s tf_ray_head matches 2 rotated ~-1 ~ run function tfmini:ray/spread/v_sniper
execute if score @s tf_ray_head matches 3 run function tfmini:ray/spread/v_sniper
execute if score @s tf_ray_head matches 4 rotated ~1 ~ run function tfmini:ray/spread/v_sniper
execute if score @s tf_ray_head matches 5 rotated ~2 ~ run function tfmini:ray/spread/v_sniper
execute if score @s tf_ray_head matches 6 rotated ~3 ~ run function tfmini:ray/spread/v_sniper
