extends Control

var hp
var score
var player_pos
var config : ConfigFile
var highScore

var menu_theme : AudioStream
var game_theme : AudioStream

func _ready() -> void:
	hp = 3
	score = 0
	config = ConfigFile.new()
	
	if (config.load("user://config.cfg") != OK):
		config.set_value("player", "high_score", 0)
		config.save("user://config.cfg")
	
	highScore = config.get_value("player", "high_score")


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
	

func set_score():
	if score > highScore:
		highScore = score
	
	config.set_value("player", "high_score", highScore)
	config.save("user://config.cfg")
