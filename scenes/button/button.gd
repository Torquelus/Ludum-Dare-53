class_name GameButton
extends Node3D


signal button_pushed

@export var target:Node
@export var button_colour_unpressed: Color = Color("c83330")
@export var button_colour_pressed: Color = Color("506627")
@export var emission_strobe_time = 1.0
@export var emission_minimum_energy = 0.3
@export var emission_maximum_energy = 1.0
@export var light_minimum_energy = 0.3
@export var light_maximum_energy = 0.5

var pushed: bool = false

@onready var button_anim: AnimationPlayer = $AnimationPlayer
@onready var button_material: StandardMaterial3D = $ButtonPushable/MeshInstance3D.get_active_material(0)
@onready var button_light: OmniLight3D = $ButtonPushable/OmniLight3D


func _ready():
	button_material.albedo_color = button_colour_unpressed
	button_material.emission = button_colour_unpressed
	button_material.emission_energy_multiplier = emission_maximum_energy
	button_light.light_color = button_colour_unpressed
	button_light.light_energy = light_maximum_energy
	
	var trans = Tween.TRANS_QUAD
	
	var material_tween = create_tween()
	material_tween.set_loops()
	material_tween.tween_property(button_material, "emission_energy_multiplier", emission_minimum_energy, emission_strobe_time).set_trans(trans)
	material_tween.tween_property(button_material, "emission_energy_multiplier", emission_maximum_energy, emission_strobe_time).set_trans(trans)
	
	var light_tween = create_tween()
	light_tween.set_loops()
	light_tween.tween_property(button_light, "light_energy", light_minimum_energy, emission_strobe_time).set_trans(trans)
	light_tween.tween_property(button_light, "light_energy", light_maximum_energy, emission_strobe_time).set_trans(trans)
	
	if target:
		button_pushed.connect(target.enable_process)
		

func _on_area_3d_body_entered(body):
	pushed = true
	button_anim.play("button_pushed")
	$AudioStreamPlayer1.play()


func _on_area_3d_body_exited(body):
	create_tween().tween_property(button_material, "albedo_color", button_colour_unpressed, 0.2)
	create_tween().tween_property(button_material, "emission", button_colour_unpressed, 0.2)
	create_tween().tween_property(button_light, "light_color", button_colour_unpressed, 0.2)
	
	pushed = false
	
	button_anim.play_backwards("button_pushed")
	
	$AudioStreamPlayer2.play()


func _on_animation_player_animation_finished(anim_name):
	if pushed == true:
		create_tween().tween_property(button_material, "albedo_color", button_colour_pressed, 0.1)
		create_tween().tween_property(button_material, "emission", button_colour_pressed, 0.1)
		create_tween().tween_property(button_light, "light_color", button_colour_pressed, 0.1)
		
		button_pushed.emit()
