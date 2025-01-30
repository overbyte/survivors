extends Node
class_name HealthComponent # allow nodes to be cast to HealthComponent

signal died

@export var max_health: float = 10

var current_health

func _ready():
	current_health = max_health
	
func damage(damage_amount: float):
	current_health = max(current_health - damage_amount, 0)
	# this calls the check_death on the next idle frame
	# to fix the error vial_drop_component.gd:18 @ on_died(): Can't change this state while flushing queries. Use call_deferred() or set_deferred() to change monitoring state instead.
	Callable(check_death).call_deferred()

func check_death():
	if current_health == 0:
		died.emit()
		owner.queue_free()
