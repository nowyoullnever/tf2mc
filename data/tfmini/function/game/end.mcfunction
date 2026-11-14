execute unless score #match tf_g_state matches 1.. run tellraw @s {"text":"[TF Mini] Cannot end: no active match.","color":"red"}
execute if score #match tf_g_state matches 1.. run function tfmini:game/end_internal
