# State changes first, so no same-tick follow-up can fire or move a rocket.
scoreboard players set #match tf_g_state 0
kill @e[type=minecraft:marker,tag=tfmini_rocket]
tag @a remove tfmini_medic_target
tag @a remove tfmini_ray_source
tag @a remove tfmini_rocket_source
function tfmini:game/sync
function tfmini:game/calculate_totals
bossbar set tfmini:match_timer visible false
tellraw @a {"text":"========== TF MINI ==========","color":"gold","bold":true}
tellraw @a {"text":"MATCH END","color":"yellow","bold":true}
execute if score #match tf_g_red > #match tf_g_blu run tellraw @a {"text":"RED TEAM WINS!","color":"red","bold":true}
execute if score #match tf_g_blu > #match tf_g_red run tellraw @a {"text":"BLU TEAM WINS!","color":"aqua","bold":true}
execute if score #match tf_g_red = #match tf_g_blu run tellraw @a {"text":"DRAW","color":"yellow","bold":true}
tellraw @a [{"text":"RED ","color":"red","bold":true},{"score":{"name":"#match","objective":"tf_g_red"},"color":"red"},{"text":" KILLS   BLU ","color":"aqua","bold":true},{"score":{"name":"#match","objective":"tf_g_blu"},"color":"aqua"},{"text":" KILLS","color":"aqua"}]
tellraw @a {"text":"PLAYER  K  D","color":"gray"}
execute as @a[tag=tfmini_match_participant] run function tfmini:game/result_online
execute as @e[type=minecraft:marker,tag=tfmini_match_roster,tag=!tfmini_roster_online] run function tfmini:game/result_offline
tellraw @a [{"text":"Duration: ","color":"gray"},{"score":{"name":"#match","objective":"tf_g_total"},"color":"white"},{"text":" minute(s)","color":"gray"}]
tellraw @a {"text":"============================","color":"gold"}
tag @a remove tfmini_match_participant
