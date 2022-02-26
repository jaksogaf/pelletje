extends Label

func _process(delta):
	if(get_node("/root/GetLevels").currentLevel == 0 || get_node("/root/GetLevels").currentLevel == -1):
		self.visible = false
	else:
		self.visible = true
	self.text = str(get_node("/root/GlobalCamera/PlayerController").coins)
