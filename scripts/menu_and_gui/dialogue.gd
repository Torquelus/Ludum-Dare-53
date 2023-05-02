class_name DialogueClass
## Class description: Creates Dialogue to appear, letter after letter via printText function
extends Node

var dialog_visible = false
var dialog_character_delay = 0.005
var dialog_fadeout_delay = 0.2

#func _ready():
	#show basic controls, use \n to force newline
	#Dialogue.create_dialog("Narrator: To move around, use WASD or the Arrow Keys. You can also use SPACE to jump.")
	
func create_dialog(textToAdd):
	print_text(textToAdd)
	dialog_visible = true
	set_dialog_visibility(true)

func print_text(dialog_text):
	$VBoxContainer/Label.text = ""	
	#create a timer to print text like a typewriter
	var t = Timer.new()
	t.set_wait_time(dialog_character_delay)
	t.set_one_shot(true)
	self.add_child(t)
	
	$AnimationPlayer.play("dialog_dissolve")
	await $AnimationPlayer.animation_finished

#print text one after the other
	for letter in dialog_text:
		t.start()
		$VBoxContainer/Label.text = $VBoxContainer/Label.text + letter
		await t.timeout

	#delay before turning off dialog box
	t.set_wait_time(len(dialog_text)*dialog_fadeout_delay)
	t.set_one_shot(true)
	t.start()
	await t.timeout
	$AnimationPlayer.play_backwards('dialog_dissolve')
	await $AnimationPlayer.animation_finished
	set_dialog_visibility(false)


func set_dialog_visibility(visible):
	$VBoxContainer.visible = visible
