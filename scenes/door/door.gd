extends RigidBody3D

var max_speed:int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AudioStreamPlayer1.play()
		
func enable_process():
	lock_rotation = not lock_rotation
	
func disable_process():
	lock_rotation = not lock_rotation
