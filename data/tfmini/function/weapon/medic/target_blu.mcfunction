execute positioned ~ ~-1.76 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_ray_source,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_medic_target
execute unless entity @a[tag=tfmini_medic_target] positioned ~ ~-1.55 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_ray_source,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_medic_target
execute unless entity @a[tag=tfmini_medic_target] positioned ~ ~-1.40 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_ray_source,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_medic_target
execute unless entity @a[tag=tfmini_medic_target] positioned ~ ~-1.10 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_ray_source,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_medic_target
execute unless entity @a[tag=tfmini_medic_target] positioned ~ ~-0.70 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_ray_source,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_medic_target
execute unless entity @a[tag=tfmini_medic_target] positioned ~ ~-0.30 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_ray_source,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_medic_target
execute if entity @a[tag=tfmini_medic_target] run function tfmini:weapon/medic/heal_blu
