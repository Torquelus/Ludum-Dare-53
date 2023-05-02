extends StaticBody3D

@export_category("Conveyer's Lever Setup Variables ")
@export var reverse: bool = false
@export var enable: bool = false
@export var disable: bool = false

@export_category("Conveyer Speed and Direction")
@export var conveyer_direction: Vector3 = Vector3(0,0,0)
@export var conveyor_strength: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	constant_linear_velocity = conveyer_direction*conveyor_strength
	$AnimationPlayer.play("conveyor_forward")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func enable_process():
	if reverse == true:
		constant_linear_velocity = constant_linear_velocity*-1
	elif enable == true:
		constant_linear_velocity = conveyer_direction*conveyor_strength
	elif disable == true:
		constant_linear_velocity = Vector3.ZERO

