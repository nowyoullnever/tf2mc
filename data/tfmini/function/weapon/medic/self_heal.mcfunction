# Called only after a held Medi Gun ray found no valid teammate.  One
# Instant Health I pulse (4 HP) every 40 ticks averages 2 HP per second.
execute if score @s tf_md_self matches 0 run effect give @s minecraft:instant_health 1 0 true
execute if score @s tf_md_self matches 0 run scoreboard players set @s tf_md_self 40
