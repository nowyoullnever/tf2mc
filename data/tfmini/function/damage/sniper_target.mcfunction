# Units are 0.25 HP. Body is 30..54 (7.5..13.5); head is 54..84 (13.5..21).
execute if score @s tf_ray_head matches 0 run scoreboard players operation @s tf_ray_damage += #thirty tf_ray_damage
execute if score @s tf_ray_head matches 1 run scoreboard players operation @s tf_ray_damage = @s tf_sn_units
execute if score @s tf_ray_head matches 1 run scoreboard players operation @s tf_ray_damage *= #thirty tf_ray_damage
execute if score @s tf_ray_head matches 1 run scoreboard players operation @s tf_ray_damage /= #forty tf_ray_damage
execute if score @s tf_ray_head matches 1 run scoreboard players operation @s tf_ray_damage += #fiftyfour tf_ray_damage
execute store result storage tfmini:damage amount float 0.25 run scoreboard players get @s tf_ray_damage
function tfmini:damage/sniper_target_apply with storage tfmini:damage
