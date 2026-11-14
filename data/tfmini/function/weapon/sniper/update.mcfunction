execute unless score @s tf_weapon matches 2 run function tfmini:weapon/sniper/clear_scope
execute if score @s tf_weapon matches 2 if score @s tf_sn_use matches 1.. run function tfmini:weapon/sniper/scope
execute if score @s tf_weapon matches 2 if score @s tf_sn_use matches 0 run function tfmini:weapon/sniper/clear_scope
execute if score @s tf_sn_use matches 1.. run scoreboard players remove @s tf_sn_use 1
