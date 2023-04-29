extends CanvasLayer


# Called when the change_scene function is called, which transitions the scene
func change_scene(target: String, type: String = 'fast_dissolve') -> void:
	if type == 'dissolve':
		transition_dissolve(target)
	else:
		transition_dissolve_fast(target)

#main menu to Game transition
func transition_dissolve(target: String) -> void:
	$AnimationPlayer.play("dissolve")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve')

#main menu to options and vice versa
func transition_dissolve_fast(target: String) -> void:
	$AnimationPlayer.play("dissolve_fast")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationPlayer.play_backwards('dissolve_fast')
