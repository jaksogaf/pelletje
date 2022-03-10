extends Label

var elapsedTime = 0.0
var minutes = 0
var seconds = 0

func _process(delta):
	if (get_node("/root/GetLevels").currentLevel > 0):
		elapsedTime += delta #door delta te gebruiken krijg je de tijd ongeacht de framerate
		minutes = int(elapsedTime/60)
		seconds = int(fmod(elapsedTime, 60)) #door cntrl+muisklik kan je de in-engine documentation openen, fmod geeft de restanten van elapsedTime/60 aka de seconden
		if (seconds < 10): 
			self.text = str( minutes , ":", "0" , seconds)
		else:
			self.text = str( minutes , ":" , seconds)
