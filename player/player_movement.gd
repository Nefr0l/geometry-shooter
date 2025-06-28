extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	
	if directionX or directionY:
		velocity.x = directionX * GameManager.player_speed
		velocity.y = directionY * GameManager.player_speed
	else:
		velocity.x = move_toward(velocity.x, 0, GameManager.player_speed)
		velocity.y = move_toward(velocity.y, 0, GameManager.player_speed)

	GameManager.player_pos = position
	move_and_slide()


func _on_score_timer_timeout() -> void:
	GameManager.score += 1
