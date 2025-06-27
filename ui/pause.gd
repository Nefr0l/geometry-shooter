extends Control

var paused

func _ready() -> void:
	paused = false
	unpause()


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pause"):
		unpause() if paused == true	else pause()


func _on_return_button_down() -> void:
	unpause()


func _on_exit_button_down() -> void:
	unpause()
	GameManager.to_menu()
	
	
func pause():
	paused = true
	show()
	get_tree().paused = true
	
	
func unpause():
	paused = false
	hide()
	get_tree().paused = false
