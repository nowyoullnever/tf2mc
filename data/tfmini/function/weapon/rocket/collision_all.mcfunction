# Muzzle-clearance identity check: exclude only this marker's owner. Every
# RED/BLU player, including teammates, is a valid direct-impact target.
execute as @a[gamemode=!spectator] if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket,distance=..0.01,sort=nearest,limit=1] tf_owner run tag @s add tfmini_rocket_direct_owner
execute positioned ~ ~-1.76 ~ as @a[gamemode=!spectator,tag=!tfmini_rocket_direct_owner,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-1.40 ~ as @a[gamemode=!spectator,tag=!tfmini_rocket_direct_owner,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-1.10 ~ as @a[gamemode=!spectator,tag=!tfmini_rocket_direct_owner,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-0.70 ~ as @a[gamemode=!spectator,tag=!tfmini_rocket_direct_owner,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute unless entity @a[tag=tfmini_rocket_direct_target] positioned ~ ~-0.30 ~ as @a[gamemode=!spectator,tag=!tfmini_rocket_direct_owner,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_rocket_direct_target] positioned ~ ~-1.76 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_rocket_direct_target] positioned ~ ~-1.40 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_rocket_direct_target] positioned ~ ~-1.10 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_rocket_direct_target] positioned ~ ~-0.70 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_rocket_direct_target] positioned ~ ~-0.30 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_rocket_direct_target
execute if entity @e[tag=tfmini_rocket_direct_target] run function tfmini:weapon/rocket/explode
tag @e[tag=tfmini_rocket_direct_target] remove tfmini_rocket_direct_target
tag @a[tag=tfmini_rocket_direct_owner] remove tfmini_rocket_direct_owner
