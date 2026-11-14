scoreboard players set #match tf_g_state 1
function tfmini:game/bossbar_update
tellraw @a {"text":"[TF MINI] MATCH RESUMED","color":"green","bold":true}
