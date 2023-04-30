extends StaticBody3D


signal applied_conveyor_force
signal disabled_conveyor_force

@export var conveyor_direction: Vector3 = Vector3(0,0,1);
@export var conveyor_strength: int = 2;

# Called when the node enters the scene tree for the first time.
func _ready():
	constant_linear_velocity = conveyor_direction*conveyor_strength
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
