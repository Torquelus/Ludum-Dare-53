extends StaticBody3D

@export var rotation_duration = 5.0
@export var rotation_direction = 360.0
@export_enum("x", "y", "z") var rotation_axis = "x"

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "rotation_degrees:" + rotation_axis, rotation_direction, rotation_duration).as_relative()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
