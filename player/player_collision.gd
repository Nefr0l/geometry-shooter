extends Node

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("remove_hp"):
		GameManager.hp -= 1
