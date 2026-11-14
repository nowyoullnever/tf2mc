# Arrow is a controlled visual projectile; no vanilla explosion command is used, so blocks/fire are never changed.
execute if score @s tf_exploded matches 1.. run return 0
scoreboard players set @s tf_exploded 1
particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 0 1 force @a[distance=..32]
playsound minecraft:entity.generic.explode master @a[distance=..32] ~ ~ ~ 0.8 1.15
tag @s add tfmini_rocket_damage_source
execute if score @s tf_team matches 1 run function tfmini:weapon/rocket/damage_red
execute if score @s tf_team matches 2 run function tfmini:weapon/rocket/damage_blu
tag @s remove tfmini_rocket_damage_source
execute on origin if entity @s[distance=..3] run damage @s 2 tfmini:rocket by @e[type=minecraft:arrow,tag=tfmini_rocket,distance=..0.1,limit=1]
# Directional vanilla player impulse is not available through a supported command path.
# Self-damage remains capped; rocket jump is explicitly BLOCKED in documentation.
kill @s
