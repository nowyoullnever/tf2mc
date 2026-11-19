scoreboard players add @s tf_life 1
execute if score @s tf_life matches 150.. run kill @s
execute if score @s tf_life matches ..149 at @s run particle minecraft:flame ~ ~ ~ 0.02 0.02 0.02 0 2 force @a[distance=..128]
execute if score @s tf_life matches ..149 at @s run particle minecraft:smoke ~ ~ ~ 0.015 0.015 0.015 0 1 force @a[distance=..128]
execute if score @s tf_life matches ..149 run function tfmini:weapon/rocket/substep
execute if score @s tf_life matches ..149 run function tfmini:weapon/rocket/substep
