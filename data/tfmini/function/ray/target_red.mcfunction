# Current ray position is shifted down to each player-foot reference height.
# HEAD is resolved before BODY, and one target tag terminates further sampling.
scoreboard players set @s tf_ray_head 0
execute positioned ~ ~-1.76 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute unless entity @a[tag=tfmini_ray_target] positioned ~ ~-1.55 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute unless entity @a[tag=tfmini_ray_target] positioned ~ ~-1.45 ~ as @a[team=RED,gamemode=!spectator,predicate=tfmini:crouching,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute unless entity @a[tag=tfmini_ray_target] positioned ~ ~-1.25 ~ as @a[team=RED,gamemode=!spectator,predicate=tfmini:crouching,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if entity @a[tag=tfmini_ray_target] run scoreboard players set @s tf_ray_head 1
execute if score @s tf_ray_head matches 0 positioned ~ ~-1.40 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if score @s tf_ray_head matches 0 unless entity @a[tag=tfmini_ray_target] positioned ~ ~-1.10 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if score @s tf_ray_head matches 0 unless entity @a[tag=tfmini_ray_target] positioned ~ ~-0.70 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if score @s tf_ray_head matches 0 unless entity @a[tag=tfmini_ray_target] positioned ~ ~-0.30 ~ as @a[team=RED,gamemode=!spectator,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_ray_target] positioned ~ ~-1.76 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_dummy_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_ray_target] unless entity @e[tag=tfmini_ray_dummy_target] positioned ~ ~-1.55 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_dummy_target
execute if entity @e[tag=tfmini_ray_dummy_target] run scoreboard players set @s tf_ray_head 1
execute if score #test_mode tf_debug matches 1.. if score @s tf_ray_head matches 0 unless entity @e[tag=tfmini_ray_target] unless entity @e[tag=tfmini_ray_dummy_target] positioned ~ ~-1.40 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_dummy_target
execute if score #test_mode tf_debug matches 1.. if score @s tf_ray_head matches 0 unless entity @e[tag=tfmini_ray_target] unless entity @e[tag=tfmini_ray_dummy_target] positioned ~ ~-1.10 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_dummy_target
execute if score #test_mode tf_debug matches 1.. if score @s tf_ray_head matches 0 unless entity @e[tag=tfmini_ray_target] unless entity @e[tag=tfmini_ray_dummy_target] positioned ~ ~-0.70 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_dummy_target
execute if score #test_mode tf_debug matches 1.. if score @s tf_ray_head matches 0 unless entity @e[tag=tfmini_ray_target] unless entity @e[tag=tfmini_ray_dummy_target] positioned ~ ~-0.30 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=RED,distance=..0.32,sort=nearest,limit=1] run tag @s add tfmini_ray_dummy_target
execute if entity @a[tag=tfmini_ray_target] run function tfmini:ray/hit_red
execute if entity @e[tag=tfmini_ray_dummy_target] run function tfmini:ray/hit_red
