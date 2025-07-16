extends CharacterBody3D

var speed = 1
var rotation_speed = 0.02
@onready var walk_animation = $animation

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_vector("move_forward", "move_back", "move_left", "move_right")
	var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if dir:
		velocity.z = dir.x * speed
		velocity.x = dir.z * speed
		walk_animation.play("walk")
	else:
		velocity.x = 0
		velocity.z = 0
		walk_animation.stop()
		
	move_and_slide()
	
