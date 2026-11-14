execute as @e[type=minecraft:arrow,tag=tfmini_hit_body,scores={tf_team=1},tag=!tfmini_explosion_probe_done,distance=..1,sort=nearest,limit=1] run tag @s add tfmini_explosion_probe
function tfmini:weapon/rocket/process_probe
execute if entity @e[type=minecraft:arrow,tag=tfmini_hit_body,scores={tf_team=1},tag=!tfmini_explosion_probe_done,distance=..1,limit=1] run function tfmini:weapon/rocket/area_blu_1
