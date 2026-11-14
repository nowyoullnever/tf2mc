scoreboard players remove @s tf_rk_ammo 1
scoreboard players set @s tf_rk_cd 20
scoreboard players set @s tf_fire 1
tag @s add tfmini_rocket_source
execute anchored eyes positioned ^ ^ ^0.75 summon minecraft:arrow run function tfmini:weapon/rocket/init_projectile
tag @s remove tfmini_rocket_source
playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 0.7 0.7
