# RUNNING only. PAUSED and IDLE intentionally do no combat, reload, or timer work.
function tfmini:game/sync
execute if score #match tf_g_timer matches 1.. run scoreboard players remove #match tf_g_timer 1
execute if score #match tf_g_timer matches 0 run function tfmini:game/end_internal
execute if score #match tf_g_state matches 1 run scoreboard players operation #match tf_g_work = #match tf_g_timer
execute if score #match tf_g_state matches 1 run scoreboard players operation #match tf_g_work %= #twenty tf_g_work
execute if score #match tf_g_state matches 1 if score #match tf_g_work matches 0 run function tfmini:game/bossbar_update
