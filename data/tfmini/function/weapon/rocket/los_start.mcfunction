scoreboard players set @s tf_los 0
execute facing entity @e[type=minecraft:arrow,tag=tfmini_explosion_target_proxy,limit=1] feet positioned ^ ^ ^0.25 run function tfmini:weapon/rocket/los
