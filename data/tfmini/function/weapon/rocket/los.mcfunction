scoreboard players add @s tf_los 1
execute positioned ~ ~-1.76 ~ if entity @a[tag=tfmini_explosion_target,distance=..0.32] run scoreboard players set @s tf_los_hit 1
execute if score @s tf_los_hit matches 0 positioned ~ ~-1.55 ~ if entity @a[tag=tfmini_explosion_target,distance=..0.32] run scoreboard players set @s tf_los_hit 1
execute if score @s tf_los_hit matches 0 positioned ~ ~-1.40 ~ if entity @a[tag=tfmini_explosion_target,distance=..0.32] run scoreboard players set @s tf_los_hit 1
execute if score @s tf_los_hit matches 0 positioned ~ ~-1.10 ~ if entity @a[tag=tfmini_explosion_target,distance=..0.32] run scoreboard players set @s tf_los_hit 1
execute if score @s tf_los_hit matches 0 positioned ~ ~-0.70 ~ if entity @a[tag=tfmini_explosion_target,distance=..0.32] run scoreboard players set @s tf_los_hit 1
execute if score @s tf_los_hit matches 0 positioned ~ ~-0.30 ~ if entity @a[tag=tfmini_explosion_target,distance=..0.32] run scoreboard players set @s tf_los_hit 1
execute if score @s tf_los_hit matches 1 run function tfmini:weapon/rocket/apply_damage
execute if score @s tf_los_hit matches 0 if block ~ ~ ~ #tfmini:ray_pass_through if score @s tf_los matches ..12 positioned ^ ^ ^0.25 run function tfmini:weapon/rocket/los
