execute if score @s tf_sn_reload matches 1.. run title @s actionbar {"text":"SNIPER | RELOADING","color":"yellow"}
execute if score @s tf_sn_reload matches 0 run title @s actionbar [{"text":"SNIPER | ","color":"aqua"},{"score":{"name":"@s","objective":"tf_sn_ammo"}},{"text":" / 1 | CHARGE ","color":"white"},{"score":{"name":"@s","objective":"tf_sn_charge"}},{"text":" / 40","color":"white"}]
