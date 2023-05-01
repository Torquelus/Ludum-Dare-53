class_name MainMenuClass 
## Class description: Calls the corresponding scene after main menu button is pressed
extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	#add fade to black or some transition
	SceneTransition.change_scene(Volume.GlobalLevelSelect.pop_front(), "dissolve")


func _on_options_button_pressed():
	SceneTransition.change_scene("res://scenes/menus_and_gui/main_options.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
