extends AudioStreamPlayer
var currentLevel = 0
var switch = false

func _process(delta):
	currentLevel = get_node("/root/GlobalCamera").currentLevel
	if (currentLevel == 0):
		if (!self.playing):
			self.stream = load("res://assets/music/Dramatic Retro Game Theme #4 (Looped).wav")
			self.play()
	if (currentLevel != 0):
		if (switch == true):
			self.stream = load("res://assets/music/JDB_Exploration 1.ogg")
			self.play()
			switch = false
