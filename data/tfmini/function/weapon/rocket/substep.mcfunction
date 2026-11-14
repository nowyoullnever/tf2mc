# Two 0.4-block substeps make the specified 0.8 blocks/tick and reduce thin-wall tunnelling.
execute if score @s tf_exploded matches 0 run tp @s ^ ^ ^0.4
execute if score @s tf_exploded matches 0 unless block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:weapon/rocket/explode
execute if score @s tf_exploded matches 0 if score @s tf_team matches 1 if entity @e[type=minecraft:arrow,tag=tfmini_hitbox,scores={tf_team=2},distance=..0.32,limit=1] run function tfmini:weapon/rocket/explode
execute if score @s tf_exploded matches 0 if score @s tf_team matches 2 if entity @e[type=minecraft:arrow,tag=tfmini_hitbox,scores={tf_team=1},distance=..0.32,limit=1] run function tfmini:weapon/rocket/explode
