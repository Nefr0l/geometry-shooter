extends CharacterBody2D

var acceleration = 1.75

func _physics_process(delta: float) -> void:
	var directionX := Input.get_axis("ui_left", "ui_right")
	var directionY := Input.get_axis("ui_up", "ui_down")
	
	if Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		acceleration = 1.75
	
	acceleration = max(acceleration - (delta *2), 1)
	
	if directionX or directionY:
		velocity.x = directionX * GameManager.player_speed * acceleration
		velocity.y = directionY * GameManager.player_speed * acceleration
	else:
		velocity.x = move_toward(velocity.x, 0, GameManager.player_speed)
		velocity.y = move_toward(velocity.y, 0, GameManager.player_speed)

	GameManager.player_pos = position
	move_and_slide()


func _on_score_timer_timeout() -> void:
	GameManager.score += 1
