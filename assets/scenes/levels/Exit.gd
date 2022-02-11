extends Area2D


func _on_Exit_body_entered(body):
	if body.get_name() == 'Player':
		match get_node("/root/GlobalCamera").currentLevel:
			1:
				get_tree().change_scene("res://assets/scenes/levels/level2.tscn")
				get_node("/root/GlobalCamera").currentLevel = 2
			2:
				get_tree().change_scene("res://assets/scenes/levels/level3.tscn")
				get_node("/root/GlobalCamera").currentLevel = 3
			3:
				get_tree().change_scene("res://assets/scenes/levels/level4.tscn")
				get_node("/root/GlobalCamera").currentLevel = 4
			4:
				get_tree().change_scene("res://assets/scenes/menu/endScreen.tscn")
				get_node("/root/GlobalCamera").currentLevel = -1
