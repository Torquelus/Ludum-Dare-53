extends StaticBody3D

@onready var door_anim: AnimationPlayer = $AnimationPlayer

var max_speed:int = 10

## used to check if we should play the door opening sound effect
var door_opening = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	if angular_velocity.y > max_speed:
#		angular_velocity.y = max_speed
#	if ((angular_velocity.y <-0.1 || angular_velocity.y>0.1) && door_opening== false):
#		if($AudioStreamPlayer.playing !=true):
#			$AudioStreamPlayer.play()
#			door_opening= true
#	if (angular_velocity.y>-0.1 && angular_velocity.y <0.1):
#		$AudioStreamPlayer.stop()
#		door_opening = false
	pass		

func enable_process():
	door_anim.play("door_opened")

func disable_process():
	door_anim.play_backwards("door_opened")
