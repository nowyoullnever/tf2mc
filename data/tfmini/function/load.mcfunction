# Safe to run repeatedly; existing objective/team errors do not abort a function.
scoreboard objectives add tf_init dummy
scoreboard objectives add tf_weapon dummy
scoreboard objectives add tf_mg_ammo dummy
scoreboard objectives add tf_mg_cd dummy
scoreboard objectives add tf_mg_reload dummy
scoreboard objectives add tf_sn_ammo dummy
scoreboard objectives add tf_sn_cd dummy
scoreboard objectives add tf_sn_reload dummy
scoreboard objectives add tf_sn_charge dummy
scoreboard objectives add tf_sn_scope dummy
scoreboard objectives add tf_rk_ammo dummy
scoreboard objectives add tf_rk_cd dummy
scoreboard objectives add tf_rk_reload dummy
scoreboard objectives add tf_rk_fired dummy
scoreboard objectives add tf_rk_muzzle dummy
scoreboard objectives add tf_tracer_mod dummy
scoreboard objectives add tf_md_self dummy
scoreboard objectives add tf_md_target dummy
scoreboard objectives add tf_md_heal dummy
scoreboard objectives add tf_fire dummy
scoreboard objectives add tf_player_id dummy
scoreboard objectives add tf_debug dummy
scoreboard objectives add tf_ray_step dummy
scoreboard objectives add tf_ray_hit dummy
scoreboard objectives add tf_ray_type dummy
scoreboard objectives add tf_ray_damage dummy
scoreboard objectives add tf_ray_head dummy
scoreboard objectives add tf_owner dummy
scoreboard objectives add tf_team dummy
scoreboard objectives add tf_life dummy
scoreboard objectives add tf_los dummy
scoreboard objectives add tf_los_hit dummy
scoreboard objectives add tf_area_count dummy
scoreboard objectives add tf_rk_damage dummy
scoreboard objectives add tf_sn_use dummy
scoreboard objectives add tf_alive dummy
scoreboard objectives add tf_deaths minecraft.custom:minecraft.deaths
scoreboard objectives add tf_deaths_seen dummy
scoreboard objectives add tf_exploded dummy
scoreboard objectives add tf_move dummy
scoreboard objectives add tf_px dummy
scoreboard objectives add tf_py dummy
scoreboard objectives add tf_pz dummy
scoreboard objectives add tf_lpx dummy
scoreboard objectives add tf_lpy dummy
scoreboard objectives add tf_lpz dummy
scoreboard objectives add tf_spread_y dummy
scoreboard objectives add tf_g_kills minecraft.custom:minecraft.player_kills
scoreboard objectives add tf_g_base_k dummy
scoreboard objectives add tf_g_base_d dummy
scoreboard objectives add tf_g_round_k dummy
scoreboard objectives add tf_g_round_d dummy
scoreboard objectives add tf_g_team dummy
scoreboard objectives add tf_g_participant dummy
scoreboard objectives add tf_g_state dummy
scoreboard objectives add tf_g_timer dummy
scoreboard objectives add tf_g_total dummy
scoreboard objectives add tf_g_red dummy
scoreboard objectives add tf_g_blu dummy
scoreboard objectives add tf_g_work dummy
scoreboard objectives add tf_g_mm dummy
scoreboard objectives add tf_g_ss dummy
# add 0 creates the fake player only when absent; never reset assigned player IDs on /reload.
scoreboard players add #next_player tf_player_id 0
scoreboard players set #forty tf_ray_damage 40
scoreboard players set #twentyfour tf_ray_damage 24
scoreboard players set #thirty tf_ray_damage 30
scoreboard players set #fortyfive tf_ray_damage 45
scoreboard players set #two tf_ray_step 2
scoreboard players set #four tf_ray_step 4
scoreboard players add #test_mode tf_debug 0
scoreboard players set #twenty tf_g_work 20
scoreboard players set #onehundred tf_g_work 100
scoreboard players set #twelvehundred tf_g_work 1200
scoreboard players add #match tf_g_state 0
scoreboard players add #match tf_g_timer 0
scoreboard players add #match tf_g_total 0
scoreboard players add #match tf_g_red 0
scoreboard players add #match tf_g_blu 0
# Migrate the prototype's short-lived proxies. Persistent proxies are recreated
# before the next combat-input phase, so stale positions cannot be queried.
kill @e[type=minecraft:arrow,tag=tfmini_hitbox]
team add RED
team add BLU
team modify RED color red
team modify BLU color blue
function tfmini:game/load
tellraw @a [{"text":"[TF Mini] loaded. Use /function tfmini:give/all and join RED or BLU.","color":"gold"}]
