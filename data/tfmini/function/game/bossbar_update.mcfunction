execute store result bossbar tfmini:match_timer value run scoreboard players get #match tf_g_timer
execute store result bossbar tfmini:match_timer max run scoreboard players get #match tf_g_total
bossbar set tfmini:match_timer visible true
bossbar set tfmini:match_timer players @a[tag=tfmini_match_participant,gamemode=!spectator]
scoreboard players operation #match tf_g_mm = #match tf_g_timer
scoreboard players operation #match tf_g_mm /= #twelvehundred tf_g_work
scoreboard players operation #match tf_g_ss = #match tf_g_timer
scoreboard players operation #match tf_g_ss %= #twelvehundred tf_g_work
scoreboard players operation #match tf_g_ss /= #twenty tf_g_work
execute store result storage tfmini:game display.minutes int 1 run scoreboard players get #match tf_g_mm
execute store result storage tfmini:game display.seconds int 1 run scoreboard players get #match tf_g_ss
execute if score #match tf_g_ss matches ..9 run function tfmini:game/bossbar_running_padded with storage tfmini:game display
execute if score #match tf_g_ss matches 10.. run function tfmini:game/bossbar_running with storage tfmini:game display
