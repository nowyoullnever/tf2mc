execute unless score #match tf_g_state matches 1 run tellraw @s {"text":"[TF Mini] Cannot pause: no running match.","color":"red"}
execute if score #match tf_g_state matches 1 run function tfmini:game/pause_commit
