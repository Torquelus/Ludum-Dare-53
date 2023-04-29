class_name PauseMenuClass
## Class description: Controls Pause Menu Overlay
extends Control

#includes the setter function 'set_is_paused'
var is_paused = false : 
	set(value):
		is_paused = value
		get_tree().paused = is_paused
		visible = is_paused

#toggles between true and false when pause action key is pressed
func _unhandled_input(event):
	if(event.is_action_pressed("pause")):
		self.is_paused = !is_paused
		visible = is_paused

func _process(delta):
	if Input.is_action_pressed("Pause"):
		visible = not visible
		
func _on_resumebutton_pressed():
	self.is_paused = false
	print_debug("Help")

func _on_quitbutton_pressed():
	get_tree().quit()
