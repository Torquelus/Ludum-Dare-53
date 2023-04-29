extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_apply_conveyer_force(direction):
	print("hello")
	set_linear_velocity(direction)


func _on_disable_conveyer_force():
	set_linear_velocity(Vector3.ZERO)
