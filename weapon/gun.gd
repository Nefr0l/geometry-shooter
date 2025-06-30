extends Area2D

var cooldown : bool = true
var timer : Timer

func _ready() -> void:
	timer = get_node("Cooldown")


func _process(delta: float) -> void:
	position = GameManager.player_pos
	var rot = position.angle_to_point(get_viewport().get_mouse_position())
	rotation = rotate_toward(rotation, rot, delta * 100)
	
	if Input.is_action_pressed("shoot") and cooldown == false:
		shoot()
		cooldown = true
		GameManager.play_sound(GameManager.sounds['SHOOT'])
		timer.start()


func shoot():
	var bullet = preload("res://weapon/bullet.tscn").instantiate()
	bullet.rotation = rotation
	bullet.position = position
	get_tree().root.add_child(bullet)


func _on_area_entered(area: Area2D) -> void:
	if area.get_collision_layer_value(2):
		area.queue_free()


func _on_cooldown_timeout() -> void:
	cooldown = false
