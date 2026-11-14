execute if entity @a[tag=tfmini_medic_target] run title @s actionbar [{"text":"MEDIC | HEALING ","color":"aqua"},{"selector":"@a[tag=tfmini_medic_target,limit=1]","color":"white"}]
execute if entity @a[tag=tfmini_medic_target] run scoreboard players set @s tf_md_target 1
execute if score @s tf_md_heal matches 0 as @a[tag=tfmini_medic_target,limit=1] run effect give @s minecraft:instant_health 1 0 true
execute if score @s tf_md_heal matches 0 run scoreboard players set @s tf_md_heal 20
tag @a[tag=tfmini_medic_target] remove tfmini_medic_target
scoreboard players set @s tf_ray_hit 1
