## Class that contains all background sounds from ambient noise to music
class_name BackgroundAudio

extends Node

# Called at start
func _ready():
	$BackgroundAmbient1.play()
	$BackgroundAmbient2.play()
	$BackgroundAmbient3.play()
