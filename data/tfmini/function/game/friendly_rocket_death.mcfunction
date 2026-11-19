# Called as the victim on the death-stat tick. Personal vanilla K/D stays
# untouched; this counter is subtracted only from competitive team totals.
scoreboard players operation #ff_owner tf_ff_owner = @s tf_ff_owner
execute if score #match tf_g_state matches 1 as @a[tag=tfmini_match_participant] if score @s tf_player_id = #ff_owner tf_ff_owner run scoreboard players add @s tf_g_ff 1
scoreboard players set @s tf_ff_timer 0
