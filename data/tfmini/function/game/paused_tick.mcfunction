# Does not advance time or combat; keeps the paused bossbar audience current
# for reconnecting eligible participants.
bossbar set tfmini:match_timer players @a[tag=tfmini_match_participant,gamemode=!spectator]
