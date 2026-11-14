scoreboard players set #match tf_g_state 2
function tfmini:game/bossbar_paused
tellraw @a {"text":"[TF MINI] MATCH PAUSED","color":"yellow","bold":true}
