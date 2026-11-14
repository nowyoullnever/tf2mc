# Six owner-bound, short-lived arrow probes approximate the player's 0.6-wide body and head.
# Arrow Owner provides an explicit, stable relation back to its player through `execute on origin`.
tag @s add tfmini_proxy_owner
execute positioned ~ ~0.30 ~ run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d,Tags:["tfmini_hitbox","tfmini_hit_body","tfmini_new_proxy"]}
execute positioned ~ ~0.70 ~ run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d,Tags:["tfmini_hitbox","tfmini_hit_body","tfmini_new_proxy"]}
execute positioned ~ ~1.10 ~ run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d,Tags:["tfmini_hitbox","tfmini_hit_body","tfmini_new_proxy"]}
execute positioned ~ ~1.40 ~ run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d,Tags:["tfmini_hitbox","tfmini_hit_body","tfmini_new_proxy"]}
execute positioned ~ ~1.55 ~ run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d,Tags:["tfmini_hitbox","tfmini_hit_head","tfmini_new_proxy"]}
execute positioned ~ ~1.76 ~ run summon minecraft:arrow ~ ~ ~ {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d,Tags:["tfmini_hitbox","tfmini_hit_head","tfmini_new_proxy"]}
execute as @e[type=minecraft:arrow,tag=tfmini_new_proxy] run data modify entity @s Owner set from entity @a[tag=tfmini_proxy_owner,limit=1] UUID
execute if entity @s[team=RED] as @e[type=minecraft:arrow,tag=tfmini_new_proxy] run scoreboard players set @s tf_team 1
execute if entity @s[team=BLU] as @e[type=minecraft:arrow,tag=tfmini_new_proxy] run scoreboard players set @s tf_team 2
execute as @e[type=minecraft:arrow,tag=tfmini_new_proxy] run scoreboard players set @s tf_head_age 0
tag @e[type=minecraft:arrow,tag=tfmini_new_proxy] remove tfmini_new_proxy
tag @s remove tfmini_proxy_owner
