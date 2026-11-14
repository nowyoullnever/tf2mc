# The advancement is refreshed by item-use events. A two-tick lease avoids treating
# merely selected spyglasses as scoped while allowing release to clear charge quickly.
scoreboard players set @s tf_sn_use 2
advancement revoke @s only tfmini:sniper_using
