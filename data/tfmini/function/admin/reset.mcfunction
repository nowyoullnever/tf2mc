kill @e[type=minecraft:arrow,tag=tfmini_rocket]
kill @e[type=minecraft:interaction,tag=tfmini_head]
tag @a remove tfmini_ray_source
tag @a remove tfmini_rocket_source
tag @a remove tfmini_medic_target
tellraw @a {"text":"[TF Mini] temporary entities removed.","color":"yellow"}
