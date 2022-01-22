extends Camera2D

var playerNode = 0
var player = 0
var targetPosition = Vector2.ZERO

func _process(delta):
	player_target_position()
	global_position = lerp(targetPosition, global_position, pow(2, -25 * delta))
	
func player_target_position():
	playerNode = get_tree().get_nodes_in_group("Player")
	if (playerNode.size() > 0):
		player = playerNode[0]
		targetPosition = player.global_position
