execute unless score #match tf_g_state matches 0 run tellraw @s {"text":"[TF Mini] Cannot start: a match is already running or paused.","color":"red"}
execute if score #match tf_g_state matches 0 run scoreboard players set #match tf_g_work 0
execute if score #match tf_g_state matches 0 store result score #match tf_g_work run data get storage tfmini:game request 100
execute if score #match tf_g_state matches 0 run scoreboard players operation #match tf_g_total = #match tf_g_work
execute if score #match tf_g_state matches 0 run scoreboard players operation #match tf_g_total %= #onehundred tf_g_work
execute if score #match tf_g_state matches 0 if score #match tf_g_work matches 100..6000 if score #match tf_g_total matches 0 if entity @a[team=RED,gamemode=!spectator] if entity @a[team=BLU,gamemode=!spectator] run function tfmini:game/start_commit
execute if score #match tf_g_state matches 0 if score #match tf_g_work matches ..99 run tellraw @s {"text":"[TF Mini] Invalid duration: use an integer from 1 to 60 minutes.","color":"red"}
execute if score #match tf_g_state matches 0 if score #match tf_g_work matches 6001.. run tellraw @s {"text":"[TF Mini] Invalid duration: use an integer from 1 to 60 minutes.","color":"red"}
execute if score #match tf_g_state matches 0 if score #match tf_g_work matches 100..6000 unless score #match tf_g_total matches 0 run tellraw @s {"text":"[TF Mini] Invalid duration: minutes must be an integer.","color":"red"}
execute if score #match tf_g_state matches 0 unless entity @a[team=RED,gamemode=!spectator] run tellraw @s {"text":"[TF Mini] Cannot start: RED needs an eligible player.","color":"red"}
execute if score #match tf_g_state matches 0 unless entity @a[team=BLU,gamemode=!spectator] run tellraw @s {"text":"[TF Mini] Cannot start: BLU needs an eligible player.","color":"red"}
