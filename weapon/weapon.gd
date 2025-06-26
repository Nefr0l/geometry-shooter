extends Area2D

var direction = 1

func _process(delta: float) -> void:
	position = GameManager.player_pos
	rotation = rotate_toward(rotation, rotation + 10 * direction, delta * 2)
	
	if Input.is_action_just_pressed("ui_accept"):
		direction *= -1


func _on_area_entered(area: Area2D) -> void:
	if (area.get_collision_layer_value(2)):
		area.queue_free()
