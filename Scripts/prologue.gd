extends Control

var taps_counter = 0

@onready var s1 = $Sprite1
@onready var s2 = $Sprite2
@onready var s3 = $Sprite3
@onready var k = $keyboard_sound

func _ready() -> void:
	k.play()

func check_and_change_sprite():
	if taps_counter == 0:
		s1.show()
	elif taps_counter == 1:
		s2.show()
		s1.hide()
	elif taps_counter == 2:
		s3.show()
		s2.hide()
	else:
		get_tree().change_scene_to_file("res://Scenes/night_1.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("continue"):
		taps_counter += 1
		if taps_counter < 3:
			k.play()
	check_and_change_sprite()
