extends Control

func _on_play_button_down() -> void:
	GameManager.reset_game()


func _on_exit_button_down() -> void:
	GameManager.exit_game()
