extends VBoxContainer

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if GameManager.hp <= 0:
		show()
		GameManager.set_score()
		get_tree().paused = true


func _on_button_button_down() -> void:
	GameManager.reset_game()


func _on_exit_to_menu_button_down() -> void:
	GameManager.to_menu()
