scoreboard players set @s tf_ray_step 0
scoreboard players set @s tf_ray_hit 0
scoreboard players set @s tf_md_target 0
function tfmini:ray/medic_red_step
execute if score @s tf_md_target matches 0 run function tfmini:weapon/medic/self_heal
