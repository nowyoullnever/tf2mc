execute if score @s tf_weapon matches 2 if predicate tfmini:scoping run function tfmini:weapon/sniper/scope
execute unless score @s tf_weapon matches 2 run scoreboard players set @s tf_sn_scope 0
execute unless predicate tfmini:scoping run scoreboard players set @s tf_sn_scope 0
execute unless predicate tfmini:scoping run scoreboard players set @s tf_sn_charge 0
