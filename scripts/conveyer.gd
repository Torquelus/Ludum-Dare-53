extends StaticBody3D


signal applyConveyerForce
signal disableConveyerForce

@export var conveyerDirection: Vector3 = Vector3(0,0,1);
@export var conveyerStrength: int = 6;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_conveyer_area_body_entered(body):
	applyConveyerForce.emit(conveyerDirection*conveyerStrength)



func _on_conveyer_area_body_exited(body):
	disableConveyerForce.emit()
