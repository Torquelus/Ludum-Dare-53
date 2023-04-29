extends RigidBody3D

var push_force = 50.0
var force: Vector3
var jump_force = 600.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	apply_force(force * push_force, Vector3.ZERO)
	
func _input(event):
	var input_dir = Input.get_vector("ui_up", "ui_down", "ui_left", "ui_right")
	force = Vector3(input_dir.y, 0, input_dir.x)
	if event.is_action_pressed("ui_accept"):
		apply_force(jump_force * Vector3.UP, Vector3.ZERO)
