scoreboard players add @s tf_los 1
execute if entity @a[tag=tfmini_explosion_target,distance=..0.75] run function tfmini:weapon/rocket/apply_damage
execute unless entity @a[tag=tfmini_explosion_target,distance=..0.75] if block ~ ~ ~ #tfmini:ray_pass_through if score @s tf_los matches ..12 positioned ^ ^ ^0.25 run function tfmini:weapon/rocket/los
