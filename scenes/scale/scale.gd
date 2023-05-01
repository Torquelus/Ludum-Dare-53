extends StaticBody3D

var counter = 0
signal correct
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("boxes"):
		counter += 1
	update_scale()


func _on_area_3d_body_exited(body):
	if body.is_in_group("boxes"):
		counter -= 1
	update_scale()
	
func update_scale():
	$Display.mesh.set_text(str("%d Boxes" % counter))
	var mat = $Display.get_active_material(0)
	if counter == 4:
		correct.emit()
		mat.albedo_color = Color8(84,143,109,255)
	else:
		mat.albedo_color = Color8(0,0,0,255)
