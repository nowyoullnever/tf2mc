execute as @e[type=minecraft:arrow,tag=tfmini_explosion_probe,limit=1] on origin unless entity @s[tag=tfmini_explosion_done] run tag @s add tfmini_explosion_target
execute if entity @a[tag=tfmini_explosion_target] run tag @e[type=minecraft:arrow,tag=tfmini_explosion_probe,limit=1] add tfmini_explosion_target_proxy
execute if entity @a[tag=tfmini_explosion_target] run function tfmini:weapon/rocket/los_start
tag @a[tag=tfmini_explosion_target] add tfmini_explosion_done
tag @a[tag=tfmini_explosion_target] remove tfmini_explosion_target
tag @e[type=minecraft:arrow,tag=tfmini_explosion_target_proxy] remove tfmini_explosion_target_proxy
tag @e[type=minecraft:arrow,tag=tfmini_explosion_probe] add tfmini_explosion_probe_done
tag @e[type=minecraft:arrow,tag=tfmini_explosion_probe] remove tfmini_explosion_probe
