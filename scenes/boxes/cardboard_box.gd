@tool
class_name CardboardBox
extends RigidBody3D

enum BoxMeshType {
	BOX_MESH_1,
	BOX_MESH_2,
	BOX_MESH_3,
	BOX_MESH_4,
	BOX_MESH_5,
	BOX_MESH_RANDOM
}

var box_meshes = [
	"res://models/cardboard_boxes/cardboard_box_1.res",
	"res://models/cardboard_boxes/cardboard_box_2.res",
	"res://models/cardboard_boxes/cardboard_box_3.res",
	"res://models/cardboard_boxes/cardboard_box_4.res",
	"res://models/cardboard_boxes/cardboard_box_5.res"
]

@export var mesh_type: BoxMeshType:
	set(new_mesh_type):
		mesh_type = new_mesh_type
		if not Engine.is_editor_hint():
			return
		if mesh_type != BoxMeshType.BOX_MESH_RANDOM:
			$MeshInstance3D.mesh = load(box_meshes[mesh_type])
		

func _ready():
	var index = mesh_type
	
	if mesh_type == BoxMeshType.BOX_MESH_RANDOM:
		var random_box_mesh_type_index = randi() % (BoxMeshType.size()-1)
		index = random_box_mesh_type_index
		
	$MeshInstance3D.mesh = load(box_meshes[index])
