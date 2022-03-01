extends Node2D

func _process(delta):
	if (Input.is_action_just_pressed("move_up")):
		#move_up is ingesteld in project/project settings/inputmap, move_up wordt ook door andere knoppen dan spacebar
		#geactiveerd, maar moest iets op title screen zetten
		get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
		get_node("/root/MusicController").switch = true
		get_node("/root/GetLevels").currentLevel = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN) #deze lijn code maakt de cursor niet meer zichtbaar
