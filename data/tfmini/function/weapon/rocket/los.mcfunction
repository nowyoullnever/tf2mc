scoreboard players add @s tf_los 1
execute if entity @e[type=minecraft:arrow,tag=tfmini_explosion_target_proxy,distance=..0.32] run function tfmini:weapon/rocket/apply_damage
execute unless entity @e[type=minecraft:arrow,tag=tfmini_explosion_target_proxy,distance=..0.32] if block ~ ~ ~ #tfmini:ray_pass_through if score @s tf_los matches ..12 positioned ^ ^ ^0.25 run function tfmini:weapon/rocket/los
