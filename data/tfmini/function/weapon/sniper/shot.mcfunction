scoreboard players set @s tf_sn_ammo 0
scoreboard players set @s tf_sn_cd 30
scoreboard players set @s tf_sn_reload 30
scoreboard players set @s tf_fire 1
scoreboard players operation @s tf_ray_damage = @s tf_sn_charge
execute unless score @s tf_sn_scope matches 1 run scoreboard players set @s tf_ray_damage 0
scoreboard players operation @s tf_ray_damage *= #twentyfour tf_ray_damage
scoreboard players operation @s tf_ray_damage /= #forty tf_ray_damage
scoreboard players set @s tf_ray_type 2
tag @s add tfmini_ray_source
execute if score @s tf_sn_scope matches 1 anchored eyes positioned ^ ^ ^0.2 run function tfmini:ray/start
execute unless score @s tf_sn_scope matches 1 run execute store result score @s tf_ray_head run random value 0..6
execute unless score @s tf_sn_scope matches 1 run execute store result score @s tf_spread_y run random value 0..6
execute unless score @s tf_sn_scope matches 1 run function tfmini:ray/spread/sniper_unscoped
tag @s remove tfmini_ray_source
scoreboard players set @s tf_sn_charge 0
playsound minecraft:entity.lightning_bolt.thunder player @s ~ ~ ~ 0.25 1.8
