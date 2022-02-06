extends Camera2D

var playerNode = 0
onready var player = get_node("/root/Player")
var targetPosition = Vector2.ZERO

func _process(delta):
	if (get_node("/root/MusicController").selectedSong != 0):
		player_target_position()
		#global_position = lerp(targetPosition, global_position, pow(2, -25 * delta))
	
func player_target_position():
		print(player)
		#targetPosition.x = player.position.x
		#targetPosition.y = player.position.y
