execute positioned ~ ~-1.76 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-1.40 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-1.10 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-0.70 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-0.30 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if entity @a[tag=tfmini_rocket_direct_target] run function tfmini:weapon/rocket/explode
tag @a[tag=tfmini_rocket_direct_target] remove tfmini_rocket_direct_target
