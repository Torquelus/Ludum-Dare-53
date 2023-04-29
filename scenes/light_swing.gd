extends SpotLight3D


func _ready():
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "rotation_degrees:x", -100.0, 3).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property(self, "rotation_degrees:x", -150.0, 3).set_trans(Tween.TRANS_CUBIC)
