execute as @e[type=minecraft:arrow,tag=tfmini_hit_head,scores={tf_team=1},distance=..0.30,sort=nearest,limit=1] on origin unless entity @s[tag=tfmini_ray_source] run tag @s add tfmini_medic_target
execute unless entity @a[tag=tfmini_medic_target] as @e[type=minecraft:arrow,tag=tfmini_hit_body,scores={tf_team=1},distance=..0.30,sort=nearest,limit=1] on origin unless entity @s[tag=tfmini_ray_source] run tag @s add tfmini_medic_target
execute if entity @a[tag=tfmini_medic_target] run function tfmini:weapon/medic/heal_red
