execute unless score #match tf_g_state matches 2 run tellraw @s {"text":"[TF Mini] Cannot resume: match is not paused.","color":"red"}
execute if score #match tf_g_state matches 2 run function tfmini:game/resume_commit
