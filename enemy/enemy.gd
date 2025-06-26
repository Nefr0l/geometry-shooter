extends Area2D

var target : Vector2
var speed = 300

func _process(delta: float) -> void:
	target = GameManager.player_pos
	var directionX = 1 if (target.x > position.x) else -1
	var directionY = 1 if (target.y > position.y) else -1
	
	var lengthX = (position.x - target.x + 0.3) / DisplayServer.screen_get_size().x * 8
	var lengthY = (position.y - target.y + 0.3) / DisplayServer.screen_get_size().y * 8
	
	directionX *= abs(lengthX)
	directionY *= abs(lengthY)

	position.x += speed * delta * directionX
	position.y += speed * delta * directionY
	
	if GameManager.hp <= 0:
		queue_free()


func _on_area_entered(area) -> void:
	if area.get_collision_layer_value(1):
		print("hit")
		GameManager.hp -= 1
		queue_free()
