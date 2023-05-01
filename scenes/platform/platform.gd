extends StaticBody3D

@export var target: Node3D
@export var linear_velocity = 1

@onready var from_pos = position
@onready var to_pos = target.position


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = (to_pos - from_pos).normalized() * linear_velocity
	move_and_collide(velocity * delta)
	constant_linear_velocity = velocity
	
	if position.floor() == to_pos.floor():
		var store_pos = to_pos
		to_pos = from_pos
		from_pos = store_pos
		
