# Marker is a logical projectile; no vanilla explosion command is used, so blocks/fire are never changed.
execute if score @s tf_exploded matches 1.. run return 0
scoreboard players set @s tf_exploded 1
execute at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a[distance=..32]
execute at @s run playsound minecraft:entity.generic.explode master @a[distance=..32] ~ ~ ~ 0.8 1.15
tag @s add tfmini_rocket_damage_source
execute if score @s tf_team matches 1 run function tfmini:weapon/rocket/damage_red
execute if score @s tf_team matches 2 run function tfmini:weapon/rocket/damage_blu
tag @s remove tfmini_rocket_damage_source
# Custom rocket self-damage is intentionally zero. This datapack has no
# integrated rocket-jump mechanic; native wind-charge work remains a POC.
kill @s
