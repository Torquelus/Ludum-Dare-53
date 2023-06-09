extends Node3D

@onready var lever_anim = $AnimationPlayer

@export var target:Node3D
signal lever_pushed

var pushed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if target:
		lever_pushed.connect(target.enable_process)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if pushed == false:
		$AudioStreamPlayer1.play(0.2)
	pushed = true
	lever_anim.play("lever_pushed")
	


func _on_animation_player_animation_finished(anim_name):
	if pushed == true:
		await $AudioStreamPlayer1.finished



func _on_audio_stream_player_1_finished():
	lever_pushed.emit()
	process_mode = Node.PROCESS_MODE_DISABLED
