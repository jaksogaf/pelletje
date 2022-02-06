extends Area2D


func _on_Exit_body_entered(body):
	if body.get_name() == 'Player':
		match get_node("/root/GlobalCamera").level:
			1:
				get_tree().change_scene("res://assets/scenes/levels/level2.tscn")
				get_node("/root/MusicController").selectedSong = 1
				get_node("/root/GlobalCamera").level = 2
			2:
				get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
				get_node("/root/GlobalCamera").level = 0
