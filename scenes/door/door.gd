extends RigidBody3D

var max_speed:int = 10

## used to check if we should play the door opening sound effect
var door_opening = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if angular_velocity.y > max_speed:
		angular_velocity.y = max_speed
	if ((angular_velocity.y <-0.1 || angular_velocity.y>0.1) && door_opening== false):
		if($AudioStreamPlayer2.playing !=true):
			$AudioStreamPlayer2.play()
			door_opening= true
	if (angular_velocity.y>-0.1 && angular_velocity.y <0.1):
		$AudioStreamPlayer2.stop()
		door_opening = false
		
func enable_process():
	lock_rotation = not lock_rotation
