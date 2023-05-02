extends Node
@export var target:Node3D

signal on
var label = 0;
# Called when the node enters the scene tree for the first time.
func _ready():
	if target:
		on.connect(target.enable_process)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_scan_area_body_entered(body):
	print ("yes")
	if body.is_in_group("player"):
		var mat = $Light/LightMesh.get_active_material(0)
		mat.albedo_color = Color8(84,143,109,255)
		on.emit()
	#$Light/LightMesh.set_surface_override_material(0,mat)


func _on_player_label_side():
	print ("hit")
