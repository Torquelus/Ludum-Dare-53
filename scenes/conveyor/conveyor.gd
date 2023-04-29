extends StaticBody3D


signal applyConveyorForce
signal disableConveyorForce

@export var conveyorDirection: Vector3 = Vector3(0,0,1);
@export var conveyorStrength: int = 6;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_conveyor_area_body_entered(body):
	print("good")
	applyConveyorForce.emit(conveyorDirection*conveyorStrength)



func _on_conveyor_area_body_exited(body):
	disableConveyorForce.emit()
