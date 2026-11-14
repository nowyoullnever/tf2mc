# Player initialization is always safe; combat work is state-gated below.
execute as @a at @s run function tfmini:player/init
execute if score #match tf_g_state matches 1 run function tfmini:game/tick
execute if score #match tf_g_state matches 2 run function tfmini:game/paused_tick
execute if score #match tf_g_state matches 1 as @a[tag=tfmini_match_participant,gamemode=!spectator] at @s run function tfmini:game/combat_player_tick
execute if score #match tf_g_state matches 1 as @e[type=minecraft:marker,tag=tfmini_rocket] at @s run function tfmini:weapon/rocket/tick
# The existing dummy mode remains an explicit singleplayer development path.
execute if score #match tf_g_state matches 0 if score #test_mode tf_debug matches 1.. as @a[team=RED,gamemode=!spectator] at @s run function tfmini:game/combat_player_tick
execute if score #match tf_g_state matches 0 if score #test_mode tf_debug matches 1.. as @a[team=BLU,gamemode=!spectator] at @s run function tfmini:game/combat_player_tick
execute if score #match tf_g_state matches 0 if score #test_mode tf_debug matches 1.. as @e[type=minecraft:marker,tag=tfmini_rocket] at @s run function tfmini:weapon/rocket/tick
execute as @a[scores={tf_debug=1..}] at @s run function tfmini:ui/debug
