scoreboard players remove @s tf_rk_ammo 1
scoreboard players set @s tf_rk_cd 20
scoreboard players set @s tf_fire 1
tag @s add tfmini_rocket_source
execute anchored eyes positioned ^ ^ ^0.75 run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Tags:["tfmini_rocket"],pickup:0b}
execute as @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..1,sort=nearest,limit=1] run scoreboard players operation @s tf_owner = @a[tag=tfmini_rocket_source,limit=1] tf_player_id
execute as @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..1,sort=nearest,limit=1] run data modify entity @s Owner set from entity @a[tag=tfmini_rocket_source,limit=1] UUID
execute as @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..1,sort=nearest,limit=1] run scoreboard players set @s tf_life 0
execute as @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..1,sort=nearest,limit=1] run scoreboard players set @s tf_team 0
execute if entity @s[team=RED] as @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..1,sort=nearest,limit=1] run scoreboard players set @s tf_team 1
execute if entity @s[team=BLU] as @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..1,sort=nearest,limit=1] run scoreboard players set @s tf_team 2
tag @s remove tfmini_rocket_source
playsound minecraft:entity.firework_rocket.launch player @s ~ ~ ~ 0.7 0.7
