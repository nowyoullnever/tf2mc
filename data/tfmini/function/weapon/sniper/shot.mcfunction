scoreboard players set @s tf_sn_ammo 0
scoreboard players set @s tf_sn_cd 30
scoreboard players set @s tf_sn_reload 30
scoreboard players set @s tf_fire 1
scoreboard players operation @s tf_ray_damage = @s tf_sn_charge
execute unless score @s tf_sn_scope matches 1 run scoreboard players set @s tf_ray_damage 0
scoreboard players operation @s tf_ray_damage *= #six tf_ray_damage
scoreboard players operation @s tf_ray_damage /= #forty tf_ray_damage
scoreboard players add @s tf_ray_damage 8
scoreboard players set @s tf_ray_type 2
tag @s add tfmini_ray_source
execute anchored eyes positioned ^ ^ ^0.2 run function tfmini:ray/start
tag @s remove tfmini_ray_source
scoreboard players set @s tf_sn_charge 0
playsound minecraft:entity.lightning_bolt.thunder player @s ~ ~ ~ 0.25 1.8
