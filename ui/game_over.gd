extends VBoxContainer

func _ready() -> void:
	hide()


func _process(delta: float) -> void:
	if GameManager.hp <= 0:
		GameManager.play_sound(GameManager.sounds['GAME_OVER'])
		show()
		GameManager.set_score()
		get_tree().paused = true


func _on_button_button_down() -> void:
	GameManager.play_sound(GameManager.sounds["CLICK"])
	GameManager.reset_game()


func _on_exit_to_menu_button_down() -> void:
	GameManager.play_sound(GameManager.sounds["CLICK"])
	GameManager.to_menu()
