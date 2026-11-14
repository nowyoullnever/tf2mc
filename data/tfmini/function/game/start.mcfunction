# Macro entry point: /function tfmini:game/start {minutes:5}
$data modify storage tfmini:game request set value $(minutes)
function tfmini:game/start_validate
