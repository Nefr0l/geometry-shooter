extends Control


func _on_play_button_down() -> void:
	GameManager.play_sound(GameManager.sounds["CLICK"])
	GameManager.reset_game()


func _on_exit_button_down() -> void:
	GameManager.play_sound(GameManager.sounds["CLICK"])
	GameManager.exit_game()
