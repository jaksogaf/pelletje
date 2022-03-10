extends Camera2D

var playerNode = 0
var player = 0
var targetPosition = Vector2.ZERO

var currentLevel = 0

func _process(delta):
	currentLevel = get_node("/root/GetLevels").currentLevel
	if (currentLevel > 0):
		player_target_position()
		global_position = lerp(targetPosition, global_position, pow(2, -25 * delta))
		#pow is macht, to the power to. Lerp zorgt ervoor dat de camera de player achtervolgd met een delay, dit maakt het smoother voor de speler
	elif(currentLevel == -1): #code om camera te zetten voor endscreen
		position.x = 300
		position.y = 175
	
func player_target_position():
	playerNode = get_tree().get_nodes_in_group("Player") #player.tscn zit in de groep 'Player', deze code pakt alles uit deze groep, in dit geval alleen de player.tscn
	if (playerNode.size() > 0): #dit checkt of player.tscn geladen is in het level
		player = playerNode[0]
		targetPosition = player.global_position

#alles onder hud moet bij Camera zodat het de camera kan volgen via CanvasLayer
