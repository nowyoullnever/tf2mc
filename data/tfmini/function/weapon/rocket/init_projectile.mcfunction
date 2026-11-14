# `execute summon … run` makes @s this exact marker; no nearest-entity association is used.
tag @s add tfmini_rocket
# Marker Rotation is the immutable direction captured at the firing instant.
data modify entity @s Rotation set from entity @a[tag=tfmini_rocket_source,limit=1] Rotation
scoreboard players operation @s tf_owner = @a[tag=tfmini_rocket_source,limit=1] tf_player_id
scoreboard players set @s tf_life 0
scoreboard players set @s tf_exploded 0
scoreboard players set @s tf_los_hit 0
scoreboard players set @s tf_area_count 0
execute if entity @a[tag=tfmini_rocket_source,team=RED,limit=1] run scoreboard players set @s tf_team 1
execute if entity @a[tag=tfmini_rocket_source,team=BLU,limit=1] run scoreboard players set @s tf_team 2
