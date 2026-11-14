# This function runs once per proxy. `tfmini_proxy_current` is unique for this
# command chain, preserving owner identity across `execute on origin`.
tag @s add tfmini_proxy_current
scoreboard players set @s tf_team 0
execute on origin run tag @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] add tfmini_proxy_owner_online
execute on origin at @s if entity @s[team=RED,gamemode=!spectator] run scoreboard players set @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] tf_team 1
execute on origin at @s if entity @s[team=BLU,gamemode=!spectator] run scoreboard players set @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] tf_team 2
execute on origin at @s if entity @e[type=minecraft:arrow,tag=tfmini_proxy_current,tag=tfmini_proxy_body0] run tp @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] ~ ~0.30 ~
execute on origin at @s if entity @e[type=minecraft:arrow,tag=tfmini_proxy_current,tag=tfmini_proxy_body1] run tp @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] ~ ~0.70 ~
execute on origin at @s if entity @e[type=minecraft:arrow,tag=tfmini_proxy_current,tag=tfmini_proxy_body2] run tp @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] ~ ~1.10 ~
execute on origin at @s if entity @e[type=minecraft:arrow,tag=tfmini_proxy_current,tag=tfmini_proxy_body3] run tp @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] ~ ~1.40 ~
execute on origin at @s if entity @e[type=minecraft:arrow,tag=tfmini_proxy_current,tag=tfmini_proxy_head0] run tp @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] ~ ~1.55 ~
execute on origin at @s if entity @e[type=minecraft:arrow,tag=tfmini_proxy_current,tag=tfmini_proxy_head1] run tp @e[type=minecraft:arrow,tag=tfmini_proxy_current,limit=1] ~ ~1.76 ~
tag @s remove tfmini_proxy_current
