extends CanvasLayer

@export var arena_time_manager: Node
@onready var label = $"%Label"

func _process(delta):
	if arena_time_manager == null:
		return
	var time_elapsed = arena_time_manager.get_time_elapsed()
	label.text = format_seconds_to_string(time_elapsed)

func format_seconds_to_string(secs: float):
	var mins = floor(secs / 60)
	var remaining_secs = secs - (mins * 60)
	return ("%02d" % mins) + ":" + ("%02d" % floor(remaining_secs))
