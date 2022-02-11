extends Camera2D

var playerNode = 0
var player = 0
var targetPosition = Vector2.ZERO

#deze moeten in andere autoload ding maar ben nu testen
var currentLevel = 0

func _process(delta):
	if (currentLevel != 0 && currentLevel != -1):
		player_target_position()
		global_position = lerp(targetPosition, global_position, pow(2, -25 * delta))
	elif(currentLevel == -1):
		position.x = 300
		position.y = 175
	
func player_target_position():
	playerNode = get_tree().get_nodes_in_group("Player")
	if (playerNode.size() > 0):
		player = playerNode[0]
		targetPosition = player.global_position
