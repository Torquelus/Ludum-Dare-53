extends StaticBody3D

@export var rotation_duration = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "rotation_degrees:x", 360.0, rotation_duration).as_relative()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
