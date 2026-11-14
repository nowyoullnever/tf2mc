# Marker is a logical projectile; no vanilla explosion command is used, so blocks/fire are never changed.
execute if score @s tf_exploded matches 1.. run return 0
scoreboard players set @s tf_exploded 1
execute at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a[distance=..32]
execute at @s run playsound minecraft:entity.generic.explode master @a[distance=..32] ~ ~ ~ 0.8 1.15
tag @s add tfmini_rocket_damage_source
execute if score @s tf_team matches 1 run function tfmini:weapon/rocket/damage_red
execute if score @s tf_team matches 2 run function tfmini:weapon/rocket/damage_blu
execute at @s as @a if score @s tf_player_id = @e[tag=tfmini_rocket_damage_source,limit=1] tf_owner if entity @s[distance=..3] run damage @s 2 tfmini:rocket by @s
tag @s remove tfmini_rocket_damage_source
# Self-damage remains capped. This datapack has no rocket-jump mechanic.
kill @s
