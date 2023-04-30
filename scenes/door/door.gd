extends RigidBody3D

var max_speed:int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if angular_velocity.y > max_speed:
		angular_velocity.y = max_speed
		
		
func enable_process():
	lock_rotation = not lock_rotation
