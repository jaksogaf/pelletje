extends Label

func _process(delta):
	self.text = str(get_node("/root/GlobalCamera/PlayerController").coins)
