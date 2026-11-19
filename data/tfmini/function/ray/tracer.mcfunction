# Density is score-configurable: #four steps (1 block) for Minigun, #two
# steps (0.5 block) for Sniper. This function runs in the existing ray context.
execute if score @s tf_ray_type matches 1 run scoreboard players operation @s tf_tracer_mod = @s tf_ray_step
execute if score @s tf_ray_type matches 1 run scoreboard players operation @s tf_tracer_mod %= #four tf_ray_step
execute if score @s tf_ray_type matches 1 if score @s tf_tracer_mod matches 0 run particle minecraft:crit ~ ~ ~ 0 0 0 0 1 force @a[distance=..64]
execute if score @s tf_ray_type matches 2 run scoreboard players operation @s tf_tracer_mod = @s tf_ray_step
execute if score @s tf_ray_type matches 2 run scoreboard players operation @s tf_tracer_mod %= #two tf_ray_step
execute if score @s tf_ray_type matches 2 if score @s tf_tracer_mod matches 0 run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 1 force @a[distance=..160]
