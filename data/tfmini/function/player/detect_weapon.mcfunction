scoreboard players set @s tf_weapon 0
execute if items entity @s weapon.mainhand minecraft:wooden_hoe[minecraft:custom_data~{tfmini:{weapon:"minigun"}}] run scoreboard players set @s tf_weapon 1
execute if items entity @s weapon.mainhand minecraft:spyglass[minecraft:custom_data~{tfmini:{weapon:"sniper"}}] run scoreboard players set @s tf_weapon 2
execute if items entity @s weapon.mainhand minecraft:iron_hoe[minecraft:custom_data~{tfmini:{weapon:"rocket"}}] run scoreboard players set @s tf_weapon 3
execute if items entity @s weapon.mainhand minecraft:carrot_on_a_stick[minecraft:custom_data~{tfmini:{weapon:"medic"}}] run scoreboard players set @s tf_weapon 4
execute if score @s tf_weapon matches 1 run function tfmini:ui/minigun
execute if score @s tf_weapon matches 2 run function tfmini:ui/sniper
execute if score @s tf_weapon matches 3 run function tfmini:ui/rocket
execute if score @s tf_weapon matches 4 run function tfmini:ui/medic
