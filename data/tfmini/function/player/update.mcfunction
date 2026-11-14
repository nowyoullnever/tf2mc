scoreboard players set @s tf_fire 0
execute if score @s tf_mg_cd matches 1.. run scoreboard players remove @s tf_mg_cd 1
execute if score @s tf_sn_cd matches 1.. run scoreboard players remove @s tf_sn_cd 1
execute if score @s tf_rk_cd matches 1.. run scoreboard players remove @s tf_rk_cd 1
execute if score @s tf_md_heal matches 1.. run scoreboard players remove @s tf_md_heal 1
execute if score @s tf_mg_reload matches 1 run scoreboard players set @s tf_mg_ammo 40
execute if score @s tf_mg_reload matches 1 run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.6 1.0
execute if score @s tf_mg_reload matches 1.. run scoreboard players remove @s tf_mg_reload 1
execute if score @s tf_sn_reload matches 1 run scoreboard players set @s tf_sn_ammo 1
execute if score @s tf_sn_reload matches 1 run playsound minecraft:item.crossbow.loading_end player @s ~ ~ ~ 0.6 1.3
execute if score @s tf_sn_reload matches 1.. run scoreboard players remove @s tf_sn_reload 1
function tfmini:player/headbox
function tfmini:player/detect_weapon
