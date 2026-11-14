scoreboard players remove @s tf_rk_ammo 1
scoreboard players set @s tf_rk_cd 20
scoreboard players set @s tf_rk_reload 0
scoreboard players set @s tf_rk_fired 1
scoreboard players set @s tf_fire 1
tag @s add tfmini_rocket_source
scoreboard players set @s tf_rk_muzzle 1
execute anchored eyes positioned ^ ^ ^0.25 unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_rk_muzzle 0
execute anchored eyes positioned ^ ^ ^0.50 unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_rk_muzzle 0
execute anchored eyes positioned ^ ^ ^0.75 unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_rk_muzzle 0
execute if score @s tf_rk_muzzle matches 1 anchored eyes positioned ^ ^ ^0.75 summon minecraft:arrow run function tfmini:weapon/rocket/init_projectile
execute if score @s tf_rk_muzzle matches 0 run playsound minecraft:block.dispenser.fail player @s ~ ~ ~ 0.5 0.8
tag @s remove tfmini_rocket_source
playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 0.7 0.7
