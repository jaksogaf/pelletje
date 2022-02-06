extends RichTextLabel

var elapsedTime = 0.0
var minutes = 0
var seconds = 0

func _process(delta):
	if (get_node("/root/MusicController").selectedSong == 0):
		self.visible = false
		elapsedTime = 0.0
	if (get_node("/root/MusicController").selectedSong != 0):
		self.visible = true
		elapsedTime += delta
		minutes = int(elapsedTime/60)
		seconds = int(fmod(elapsedTime, 60))
		if (seconds > 60):
			seconds = 0
			
		if (seconds < 10): 
			self.text = str( minutes , ":", "0" , seconds)
		else:
			self.text = str( minutes , ":" , seconds)
