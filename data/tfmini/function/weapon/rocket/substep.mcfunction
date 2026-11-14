# Two 0.4-block substeps make the specified 0.8 blocks/tick and reduce thin-wall tunnelling.
execute if score @s tf_exploded matches 0 run tp @s ^ ^ ^0.4
execute if score @s tf_exploded matches 0 unless block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:weapon/rocket/explode
execute if score @s tf_exploded matches 0 if score @s tf_team matches 1 run function tfmini:weapon/rocket/collision_blu
execute if score @s tf_exploded matches 0 if score @s tf_team matches 2 run function tfmini:weapon/rocket/collision_red
