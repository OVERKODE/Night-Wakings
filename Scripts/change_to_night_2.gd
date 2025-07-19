extends Control

@onready var timer = $Timer
@onready var sound = $change_scene

func _ready() -> void:
	sound.play()
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file('res://Scenes/night_2.tscn')
