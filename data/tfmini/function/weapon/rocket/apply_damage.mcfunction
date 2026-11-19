# The marker is still the executor. Mark only the selected owner as self so it
# cannot receive both ordinary splash and the fixed 3-HP self-damage.
execute as @a[tag=tfmini_explosion_target,limit=1] if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner run tag @s add tfmini_rocket_self_target
# A teammate target remembers the rocket owner for the next death-stat update.
execute if score @s tf_team matches 1 as @a[team=RED,tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] run scoreboard players operation @s tf_ff_owner = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner
execute if score @s tf_team matches 2 as @a[team=BLU,tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] run scoreboard players operation @s tf_ff_owner = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner
execute if score @s tf_team matches 1 as @a[team=RED,tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] run scoreboard players set @s tf_ff_timer 3
execute if score @s tf_team matches 2 as @a[team=BLU,tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] run scoreboard players set @s tf_ff_timer 3
# Fixed self-damage always takes precedence over the 9/6/3 distance ring.
execute as @a if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner run damage @a[tag=tfmini_rocket_self_target,limit=1] 3 minecraft:player_explosion by @s
execute if score @s tf_rk_damage matches 9 as @a if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner run damage @e[tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] 9 minecraft:player_explosion by @s
execute if score @s tf_rk_damage matches 6 as @a if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner run damage @e[tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] 6 minecraft:player_explosion by @s
execute if score @s tf_rk_damage matches 3 as @a if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner run damage @e[tag=tfmini_explosion_target,tag=!tfmini_rocket_self_target,limit=1] 3 minecraft:player_explosion by @s
tag @a[tag=tfmini_rocket_self_target] remove tfmini_rocket_self_target
