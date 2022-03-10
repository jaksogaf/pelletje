extends AudioStreamPlayer
var currentLevel = 0
var switch = false

func _process(delta):
	currentLevel = get_node("/root/GetLevels").currentLevel
	if (currentLevel == 0):
		if (!self.playing):
			self.stream = load("res://assets/music/Dramatic Retro Game Theme #4 (Looped).wav")
			self.play()
	elif (currentLevel == -1 && switch == true):
		self.stream = load("res://assets/music/Victory1.mp3")
		self.play()
		switch = false
	elif(currentLevel > 0 && switch == true):
		self.stream = load("res://assets/music/JDB_Exploration 1.ogg")
		self.play()
		switch = false
