scoreboard players set @s tf_los 0
scoreboard players set @s tf_los_hit 0
execute facing entity @a[tag=tfmini_explosion_target,limit=1] eyes positioned ^ ^ ^0.25 run function tfmini:weapon/rocket/los
