extends Control

var hp

func _ready() -> void:
	hp = 3

func _process(delta: float) -> void:
	pass

func reset_game():
	get_tree().change_scene_to_file("res://core/game.tscn")
	get_tree().paused = false
	hp = 3
	
func to_menu():
	get_tree().change_scene_to_file("res://core/main_menu.tscn")
	get_tree().paused = false
	
func exit_game():
	get_tree().quit()
