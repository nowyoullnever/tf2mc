# Two 0.4-block substeps make the specified 0.8 blocks/tick and reduce thin-wall tunnelling.
tp @s ^ ^ ^0.4
unless block ~ ~ ~ #tfmini:ray_pass_through run function tfmini:weapon/rocket/explode
execute if score @s tf_team matches 1 if entity @a[team=BLU,gamemode=!spectator,distance=..0.55] run function tfmini:weapon/rocket/explode
execute if score @s tf_team matches 2 if entity @a[team=RED,gamemode=!spectator,distance=..0.55] run function tfmini:weapon/rocket/explode
