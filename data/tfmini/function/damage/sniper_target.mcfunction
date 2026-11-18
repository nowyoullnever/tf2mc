# tf_ray_damage is the 0..24 charge bonus in quarter-HP units.
# Body base is 30 (7.5 HP); head base is 45 (11.25 HP).
execute if score @s tf_ray_head matches 0 run scoreboard players operation @s tf_ray_damage += #thirty tf_ray_damage
execute if score @s tf_ray_head matches 1 run scoreboard players operation @s tf_ray_damage += #fortyfive tf_ray_damage
execute store result storage tfmini:damage amount float 0.25 run scoreboard players get @s tf_ray_damage
function tfmini:damage/sniper_target_apply with storage tfmini:damage
