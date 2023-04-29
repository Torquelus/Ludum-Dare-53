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
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

#Updates Volume Global variable 
func _on_h_slider_value_changed(value):
	$CenterContainer/VBoxContainer/HSlider/VolumeLabel.text = "Volume: " + str(value)
	$"/root/Volume".GlobalVolume = value


