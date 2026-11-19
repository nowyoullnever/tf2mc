# Current position remains the marker impact point after `as`; charge starts
# only when this marker's persistent owner is within the 3-block radius.
execute if score #wind_enabled tf_debug matches 1.. at @s as @a[gamemode=!spectator,distance=..3] if score @s tf_player_id = @e[type=minecraft:marker,tag=tfmini_rocket_damage_source,distance=..0.01,sort=nearest,limit=1] tf_owner run summon minecraft:wind_charge ~ ~ ~ {Motion:[0.0d,-0.10d,0.0d],Tags:["tfmini_rocket_wind"]}
