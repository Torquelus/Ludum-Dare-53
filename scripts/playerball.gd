extends RigidBody3D


@export var push_force = 50.0
@export var jump_force = 600.0


var _force_dir: Vector3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	apply_force(_force_dir * push_force, Vector3.ZERO)
	
func _input(event):
	var input_dir = Input.get_vector("move_up", "move_down", "move_left", "move_right")
	_force_dir = Vector3(input_dir.y, 0, input_dir.x)
	if event.is_action_pressed("jump"):
		apply_force(jump_force * Vector3.UP, Vector3.ZERO)
