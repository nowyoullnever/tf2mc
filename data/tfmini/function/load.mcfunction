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
scoreboard objectives add tf_head_age dummy
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
# add 0 creates the fake player only when absent; never reset assigned player IDs on /reload.
scoreboard players add #next_player tf_player_id 0
scoreboard players set #six tf_ray_damage 6
scoreboard players set #forty tf_ray_damage 40
team add RED
team add BLU
team modify RED color red
team modify BLU color blue
tellraw @a [{"text":"[TF Mini] loaded. Use /function tfmini:give/all and join RED or BLU.","color":"gold"}]
