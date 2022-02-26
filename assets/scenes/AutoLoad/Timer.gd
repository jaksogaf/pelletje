extends Label

var elapsedTime = 0.0
var minutes = 0
var seconds = 0

	

func _process(delta):
	if (get_node("/root/GetLevels").currentLevel == 0 || get_node("/root/GetLevels").currentLevel == -1 ):
		self.visible = false
	elif (get_node("/root/GetLevels").currentLevel != 0):
		self.visible = true
		elapsedTime += delta
		minutes = int(elapsedTime/60)
		seconds = int(fmod(elapsedTime, 60))
		if (seconds < 10): 
			self.text = str( minutes , ":", "0" , seconds)
		else:
			self.text = str( minutes , ":" , seconds)
