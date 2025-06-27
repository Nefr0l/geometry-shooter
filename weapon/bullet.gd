extends Area2D

func _process(delta: float) -> void:
	position += Vector2(1000, 0).rotated(rotation) * delta


func _on_area_entered(area: Area2D) -> void:
	if area.get_collision_layer_value(2):
		area.queue_free()
		queue_free()


func _on_destroy_timer_timeout() -> void:
	queue_free()
