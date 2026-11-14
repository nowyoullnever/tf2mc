execute positioned ~ ~-1.10 ~ as @a[team=BLU,gamemode=!spectator,tag=!tfmini_explosion_done,distance=1..2,sort=nearest,limit=1] run tag @s add tfmini_explosion_target
execute if score #test_mode tf_debug matches 1.. unless entity @e[tag=tfmini_explosion_target] positioned ~ ~-1.10 ~ as @e[type=minecraft:villager,tag=tfmini_test_dummy,team=BLU,tag=!tfmini_explosion_done,distance=1..2,sort=nearest,limit=1] run tag @s add tfmini_explosion_target
execute if entity @e[tag=tfmini_explosion_target] run function tfmini:weapon/rocket/los_start
tag @e[tag=tfmini_explosion_target] add tfmini_explosion_done
tag @e[tag=tfmini_explosion_target] remove tfmini_explosion_target
scoreboard players add @s tf_area_count 1
execute if score @s tf_area_count matches ..7 positioned ~ ~-1.10 ~ if entity @a[team=BLU,gamemode=!spectator,tag=!tfmini_explosion_done,distance=1..2,limit=1] run function tfmini:weapon/rocket/area_red_2
execute if score #test_mode tf_debug matches 1.. if score @s tf_area_count matches ..7 positioned ~ ~-1.10 ~ if entity @e[type=minecraft:villager,tag=tfmini_test_dummy,team=BLU,tag=!tfmini_explosion_done,distance=1..2,limit=1] run function tfmini:weapon/rocket/area_red_2
