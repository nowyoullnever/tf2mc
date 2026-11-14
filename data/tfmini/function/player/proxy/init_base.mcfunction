tag @s add tfmini_hitbox
tag @s add tfmini_proxy_persistent
data merge entity @s {NoGravity:1b,Silent:1b,Invulnerable:1b,pickup:0b,damage:0.0d}
data modify entity @s Owner set from entity @a[tag=tfmini_proxy_owner,limit=1] UUID
scoreboard players set @s tf_team 0
