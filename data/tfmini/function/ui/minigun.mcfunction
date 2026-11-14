execute if score @s tf_mg_reload matches 1.. run title @s actionbar {"text":"MINIGUN | RELOADING","color":"yellow"}
execute if score @s tf_mg_reload matches 0 run title @s actionbar [{"text":"MINIGUN | ","color":"gold"},{"score":{"name":"@s","objective":"tf_mg_ammo"}},{"text":" / 40","color":"white"}]
