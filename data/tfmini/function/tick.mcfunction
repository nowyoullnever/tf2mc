# Per-player work is sequential. Temporary tags are always removed before the next player.
execute as @a at @s run function tfmini:player/init
execute as @a at @s run function tfmini:player/update
execute as @a at @s if predicate tfmini:fire_held run function tfmini:input/fire
execute as @a at @s run function tfmini:weapon/sniper/update
execute as @a at @s run function tfmini:weapon/rocket/reload
execute as @e[type=minecraft:marker,tag=tfmini_rocket] at @s run function tfmini:weapon/rocket/tick
execute as @a[scores={tf_debug=1..}] at @s run function tfmini:ui/debug
