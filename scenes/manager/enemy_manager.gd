extends Node

#viewport width is 640 so use radius of half that plus a bit
const SPAWN_RADIUS = 375

@export var basic_enemy_scene: PackedScene

func _ready():
	$Timer.timeout.connect(on_timer_timeout)

func on_timer_timeout():
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	#viewport width is 640 so use radius of that
	var random_direction = Vector2.RIGHT.rotated(randf_range(0, TAU))
	var spawn_position = player.global_position + (random_direction * SPAWN_RADIUS)
	
	var enemy = basic_enemy_scene.instantiate() as Node2D
	get_parent().add_child(enemy)
	enemy.global_position = spawn_position
