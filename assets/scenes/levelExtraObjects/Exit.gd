extends Area2D


func _on_Exit_body_entered(body):
	if body.get_name() == 'Player':	
		var levelPaths = get_node("/root/GetLevels").levelsPaths()
		if get_node("/root/GetLevels").currentLevel < len(levelPaths):
			get_node("/root/GetLevels").currentLevel += 1
			get_tree().change_scene(levelPaths[get_node("/root/GetLevels").currentLevel - 1])
		else:
			get_tree().change_scene("res://assets/scenes/menu/endScreen.tscn")
			get_node("/root/GetLevels").currentLevel = -1
			get_node("/root/MusicController").switch = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
#hieronder is de oude code voor het switchen van levels, match is een switch statement. Deze code staat hier nog voor als er iets fout is met nieuwe scrip.	
		"""
		match get_node("/root/GetLevels").currentLevel:
			1:
				get_tree().change_scene("res://assets/scenes/levels/level2.tscn")
				get_node("/root/GetLevels").currentLevel = 2
			2:
				get_tree().change_scene("res://assets/scenes/levels/level3.tscn")
				get_node("/root/GetLevels").currentLevel = 3
			3:
				get_tree().change_scene("res://assets/scenes/levels/level4.tscn")
				get_node("/root/GetLevels").currentLevel = 4
			4:
				get_tree().change_scene("res://assets/scenes/menu/endScreen.tscn")
				get_node("/root/GetLevels").currentLevel = -1
		"""
