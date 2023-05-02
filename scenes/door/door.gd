extends StaticBody3D


@export var door_height: float = 2
@onready var initial_position = position.y
var max_speed:int = 10
## used to check if we should play the door opening sound effect
var door_opening = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass		

func enable_process():
	#door_anim.play("door_animations/door_opened")
	var door_open_tween = create_tween()
	door_open_tween.tween_property(self, "position:y", initial_position+door_height, 0.5).set_trans(Tween.TRANS_CUBIC)
	$AudioStreamPlayer.play()

func disable_process():
	#door_anim.play_backwards("door_animations/door_opened")
	if(get_tree()!=null):
		var door_close_tween = create_tween()
		door_close_tween.tween_property(self, "position:y", initial_position, 0.5).set_trans(Tween.TRANS_CUBIC)
		$AudioStreamPlayer.play()
