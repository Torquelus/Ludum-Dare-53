extends Node3D

@onready var button_anim = $AnimationPlayer
var pressed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	pressed = true
	button_anim.play("button_pushed")

func _on_area_3d_body_exited(body):
	pressed = false
	button_anim.play_backwards("button_pushed")


func _on_animation_player_animation_finished(anim_name):
	if pressed == true:
		print("button pressed")
	else:
		print("noPress")
