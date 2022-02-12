extends RichTextLabel

var playerHealth = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if (get_node("/root/GlobalCamera").currentLevel == 0 || get_node("/root/GlobalCamera").currentLevel == -1 ):
		self.visible = false
	elif (get_node("/root/GlobalCamera").currentLevel != 0):
		self.visible = true
		playerHealth = get_node("/root/GlobalCamera/PlayerController").playerHealth
		self.text = str(playerHealth)
