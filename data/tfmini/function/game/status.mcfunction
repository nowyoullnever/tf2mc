execute if score #match tf_g_state matches 0 run tellraw @s {"text":"[TF Mini] Match status: IDLE","color":"gray"}
execute if score #match tf_g_state matches 1 run tellraw @s [{"text":"[TF Mini] Match status: RUNNING, ticks remaining: ","color":"green"},{"score":{"name":"#match","objective":"tf_g_timer"},"color":"white"}]
execute if score #match tf_g_state matches 2 run tellraw @s [{"text":"[TF Mini] Match status: PAUSED, ticks remaining: ","color":"yellow"},{"score":{"name":"#match","objective":"tf_g_timer"},"color":"white"}]
