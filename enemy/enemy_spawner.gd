extends Timer

func _on_timeout() -> void:
	GameManager.spawn_enemy()
	wait_time = max(wait_time / 1.05, 1.5)
