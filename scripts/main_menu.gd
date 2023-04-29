class_name MainMenuClass 
## Class description: Calls the corresponding scene after main menu button is pressed
extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/3dboxtestscene.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_options.tscn")


func _on_quit_button_pressed():
	pass # Replace with function body.
