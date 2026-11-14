tag @s add tfmini_rocket_source
scoreboard players set @s tf_rk_muzzle 1
execute anchored eyes positioned ^ ^ ^0.25 unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_rk_muzzle 0
execute anchored eyes positioned ^ ^ ^0.50 unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_rk_muzzle 0
execute anchored eyes positioned ^ ^ ^0.75 unless block ~ ~ ~ #tfmini:ray_pass_through run scoreboard players set @s tf_rk_muzzle 0
execute if score @s tf_rk_muzzle matches 1 anchored eyes positioned ^ ^ ^0.75 summon minecraft:marker run function tfmini:weapon/rocket/init_projectile
execute if score @s tf_rk_muzzle matches 1 run scoreboard players remove @s tf_rk_ammo 1
execute if score @s tf_rk_muzzle matches 1 run scoreboard players set @s tf_rk_cd 20
execute if score @s tf_rk_muzzle matches 1 run scoreboard players set @s tf_rk_reload 0
execute if score @s tf_rk_muzzle matches 1 run scoreboard players set @s tf_rk_fired 1
execute if score @s tf_rk_muzzle matches 1 run scoreboard players set @s tf_fire 1
execute if score @s tf_rk_muzzle matches 0 run playsound minecraft:block.dispenser.fail player @s ~ ~ ~ 0.5 0.8
tag @s remove tfmini_rocket_source
execute if score @s tf_rk_muzzle matches 1 run playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 0.7 0.7
