# One persistent arrow per named probe. No nearest-entity lookup is used.
tag @s add tfmini_proxy_owner
execute positioned ~ ~0.30 ~ summon minecraft:arrow run function tfmini:player/proxy/init_body0
execute positioned ~ ~0.70 ~ summon minecraft:arrow run function tfmini:player/proxy/init_body1
execute positioned ~ ~1.10 ~ summon minecraft:arrow run function tfmini:player/proxy/init_body2
execute positioned ~ ~1.40 ~ summon minecraft:arrow run function tfmini:player/proxy/init_body3
execute positioned ~ ~1.55 ~ summon minecraft:arrow run function tfmini:player/proxy/init_head0
execute positioned ~ ~1.76 ~ summon minecraft:arrow run function tfmini:player/proxy/init_head1
tag @s remove tfmini_proxy_owner
tag @s add tfmini_proxy_ready
