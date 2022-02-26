extends Node2D

func _process(delta):
	if (Input.is_action_just_pressed("move_up")):
		get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
		#get_tree().change_scene("res://assets/scenes/endScreen.tscn")
		get_node("/root/MusicController").switch = true
		get_node("/root/GetLevels").currentLevel = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
