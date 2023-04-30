class_name MainOptionsClass 
## Class description: Controls the Options, which is the volume slider
extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CenterContainer/VBoxContainer/HSlider/VolumeLabel.text = "Volume: " + \
	str($"/root/Volume".GlobalVolume)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_menu_button_pressed():
	SceneTransition.change_scene("res://scenes/menus_and_gui/main_menu.tscn")
	#$AudioStreamPlayer.volume_db = $AudioStreamPlayer.volume_db-10
	

#Updates Volume Global variable 
func _on_h_slider_value_changed(value):
	$CenterContainer/VBoxContainer/HSlider/VolumeLabel.text = "Volume: " + str(value)
	$"/root/Volume".GlobalVolume = value
	AudioServer.set_bus_volume_db(0,db_to_linear(value-40))
	if($AudioStreamPlayer.playing==false):
		$AudioStreamPlayer.play()


