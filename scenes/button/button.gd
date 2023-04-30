extends Node3D

@onready var button_anim = $AnimationPlayer

@export var target:Node
signal button_pushed

var pushed: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if target:
		button_pushed.connect(target.enable_process)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	pushed = true
	button_anim.play("button_pushed")

func _on_area_3d_body_exited(body):
	pushed = false
	button_anim.play_backwards("button_pushed")


func _on_animation_player_animation_finished(anim_name):
	if pushed == true:
		button_pushed.emit()
