extends Label

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	text = str(GameManager.hp)
