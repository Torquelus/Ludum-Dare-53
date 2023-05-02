extends StaticBody3D
@export var target:Node3D

var counter = 0
signal correct
signal incorrect
# Called when the node enters the scene tree for the first time.
func _ready():
	if target:
		correct.connect(target.enable_process)
		incorrect.connect(target.disable_process)
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
	if counter == 1:
		correct.emit()
		mat.albedo_color = Color8(84,143,109,255)
	else:
		incorrect.emit()
		mat.albedo_color = Color8(0,0,0,255)
