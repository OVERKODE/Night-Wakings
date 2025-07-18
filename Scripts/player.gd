extends CharacterBody3D

var speed = 1
var sensivity = 0.003
var rotation_x = 0
var rotation_y = 0
@onready var walk_animation = $animation
@onready var step_sound = $steps_sound

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	var move_dir = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		move_dir += -transform.basis.z
	if Input.is_action_pressed("move_back"):
		move_dir += transform.basis.z
	if Input.is_action_pressed("move_left"):
		move_dir += -transform.basis.x
	if Input.is_action_pressed("move_right"):
		move_dir += transform.basis.x
		
	move_dir = move_dir.normalized()
	
	if move_dir:
		velocity.z = move_dir.z * speed
		velocity.x = move_dir.x * speed
		walk_animation.play("walk")
	else:
		velocity.x = 0
		velocity.z = 0
		walk_animation.stop()
		step_sound.stop()
		
	move_and_slide()
	
func _input(e: InputEvent) -> void:
	if e is InputEventMouseMotion:
		rotation_x -= e.relative.y * sensivity
		rotation_y -= e.relative.x * sensivity
		
		if rotation_x > 1: rotation_x = 1
		if rotation_x < -1: rotation_x = -1
		
		transform.basis = Basis(Vector3(0,1,0), rotation_y)
		$camera.transform.basis = Basis(Vector3(1,0,0), rotation_x)
