extends Control

var paused

func _ready() -> void:
	paused = false
	unpause()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		unpause() if paused == true	else pause()
		GameManager.play_sound(GameManager.sounds["PAUSE"])

func _on_return_button_down() -> void:
	GameManager.play_sound(GameManager.sounds["CLICK"])
	unpause()


func _on_exit_button_down() -> void:
	unpause()
	GameManager.play_sound(GameManager.sounds["CLICK"])
	GameManager.to_menu()
	
	
func pause():
	paused = true
	show()
	get_tree().paused = true
	
	
func unpause():
	paused = false
	hide()
	get_tree().paused = false
