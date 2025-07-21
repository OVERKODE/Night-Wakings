extends Node3D

func _process(delta: float) -> void:
	var look = $player/camera/look
	if look.is_colliding():
		var object = look.get_collider()
		if object.name == "glass_body" and Input.is_action_just_pressed("interact"):
			object.hide()
			$player/goal/task_2.hide()
			$player/goal/task_3.show()
			$player/goal/player_statement.hide()
			$player/goal/player_statement_2.show()
			$BlackMonster.show()
			$final/shape.disabled = false
		if object.name == "monster":
			$monster/dissapeared_sound.play()
			object.hide()
			$monster/shape.disabled = true
			$player/goal/task.hide()
			$player/goal/task_2.show()
			$player/goal/player_statement.show()
		if object.name == "final":
			get_tree().change_scene_to_file("res://Scenes/titles.tscn")
