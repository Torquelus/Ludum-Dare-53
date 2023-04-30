# Camera class following player
class_name PlayerCamera
extends Camera3D


@onready var player: RigidBody3D = get_owner().get_node("Box")
@onready var _offset = position


func _physics_process(delta):
	position = lerp(position, player.position + _offset, 5.0*delta)
