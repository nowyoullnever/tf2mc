execute if score @s tf_mg_reload matches 1.. run return 0
execute if score @s tf_mg_cd matches 1.. run return 0
execute if score @s tf_mg_ammo matches 1.. run function tfmini:weapon/minigun/shot
execute if score @s tf_mg_ammo matches ..0 run function tfmini:weapon/minigun/empty
