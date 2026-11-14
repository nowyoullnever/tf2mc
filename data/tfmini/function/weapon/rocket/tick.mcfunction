scoreboard players add @s tf_life 1
execute if score @s tf_life matches 100.. run kill @s
execute if score @s tf_life matches ..99 run particle minecraft:flame ~ ~ ~ 0.02 0.02 0.02 0 2 force @a[distance=..32]
execute if score @s tf_life matches ..99 run function tfmini:weapon/rocket/substep
execute if score @s tf_life matches ..99 run function tfmini:weapon/rocket/substep
