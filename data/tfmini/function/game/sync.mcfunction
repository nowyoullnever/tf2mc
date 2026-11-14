tag @e[type=minecraft:marker,tag=tfmini_match_roster] remove tfmini_roster_online
execute as @a[tag=tfmini_match_participant] run function tfmini:game/update_player
