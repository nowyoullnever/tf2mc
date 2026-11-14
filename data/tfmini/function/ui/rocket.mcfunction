execute if score @s tf_rk_reload matches 1.. run title @s actionbar {"text":"ROCKET | LOADING","color":"yellow"}
execute if score @s tf_rk_reload matches 0 run title @s actionbar [{"text":"ROCKET | ","color":"red"},{"score":{"name":"@s","objective":"tf_rk_ammo"}},{"text":" / 4","color":"white"}]
