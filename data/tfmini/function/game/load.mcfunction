# Existing scores survive /reload. Only the bossbar presentation is rebuilt.
bossbar add tfmini:match_timer {"text":"TF MINI | IDLE"}
execute if score #match tf_g_state matches 1 run function tfmini:game/bossbar_update
execute if score #match tf_g_state matches 2 run function tfmini:game/bossbar_paused
execute if score #match tf_g_state matches 0 run bossbar set tfmini:match_timer visible false
execute if score #match tf_g_state matches 0 run kill @e[type=minecraft:marker,tag=tfmini_rocket]
