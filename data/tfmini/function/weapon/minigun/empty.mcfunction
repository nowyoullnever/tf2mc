execute unless score @s tf_mg_reload matches 1.. run playsound minecraft:block.dispenser.fail player @s ~ ~ ~ 0.5 1.3
execute unless score @s tf_mg_reload matches 1.. run scoreboard players set @s tf_mg_reload 60
