extends Control

var hp
var score
var player_pos
var config : ConfigFile
var highScore

var audio : AudioStreamPlayer2D
var sounds = {CLICK = "ui_click.wav", PAUSE = "ui_pause.wav", ENEMY_DEATH = "enemy_death.wav",
GAME_OVER = "game_over.wav", HOVER = "ui_hover.wav", DAMAGE = "damage.wav", SHOOT = "shoot.wav"}

var player_speed = 300
var enemy_speed = 300

func _ready() -> void:
	hp = 3
	score = 0
	config = ConfigFile.new()
	audio = AudioStreamPlayer2D.new()
	audio.process_mode = Node.PROCESS_MODE_ALWAYS
	add_child(audio)
	
	if (config.load("user://config.cfg") != OK):
		config.set_value("player", "high_score", 0)
		config.save("user://config.cfg")
	
	highScore = config.get_value("player", "high_score")


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
	get_tree().root.add_child(enemy)
	

func set_score():
	if score > highScore:
		highScore = score
	
	config.set_value("player", "high_score", highScore)
	config.save("user://config.cfg")


func play_sound(sound_name):
	var audio_stream = load("res://audio/" + str(sound_name))
	audio.stream = audio_stream
	audio.play()
