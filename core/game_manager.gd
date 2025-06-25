extends Control

var hp
var score
var player_pos

func _ready() -> void:
	hp = 3
	score = 0


func _process(delta: float) -> void:
	score += 1


func reset_game():
	get_tree().change_scene_to_file("res://core/game.tscn")
	get_tree().paused = false
	hp = 3
	score = 0

	
func to_menu():
	get_tree().change_scene_to_file("res://core/main_menu.tscn")
	get_tree().paused = false

	
func exit_game():
	get_tree().quit()
	
	
func spawn_enemy():
	print("spawned")
	var enemy = preload("res://enemy/enemy.tscn").instantiate()
	
	var enemy_pos : Vector2
	enemy_pos.x = randf_range(0, DisplayServer.screen_get_size().x)
	enemy_pos.y = 0 if (randi_range(0, 1) == 1) else DisplayServer.screen_get_size().y
	
	enemy.position = enemy_pos
	add_child(enemy)
