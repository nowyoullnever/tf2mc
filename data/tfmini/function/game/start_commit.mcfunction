kill @e[type=minecraft:marker,tag=tfmini_rocket]
kill @e[type=minecraft:marker,tag=tfmini_match_roster]
tag @a remove tfmini_match_participant
tag @a remove tfmini_match_register
tag @a remove tfmini_medic_target
tag @a remove tfmini_ray_source
tag @a remove tfmini_rocket_source
execute as @a[team=RED,gamemode=!spectator] run function tfmini:game/register_red
execute as @a[team=BLU,gamemode=!spectator] run function tfmini:game/register_blu
scoreboard players operation #match tf_g_total = #match tf_g_work
scoreboard players operation #match tf_g_total /= #onehundred tf_g_work
scoreboard players operation #match tf_g_timer = #match tf_g_total
scoreboard players operation #match tf_g_timer *= #twelvehundred tf_g_work
scoreboard players set #match tf_g_red 0
scoreboard players set #match tf_g_blu 0
scoreboard players set #match tf_g_state 1
function tfmini:game/bossbar_update
tellraw @a [{"text":"[TF MINI] MATCH START — ","color":"gold","bold":true},{"score":{"name":"#match","objective":"tf_g_total"},"color":"yellow"},{"text":" minute(s)","color":"yellow"}]
