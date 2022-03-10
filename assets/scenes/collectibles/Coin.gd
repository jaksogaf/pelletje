extends Area2D


# warning-ignore:unused_argument
func _process(delta):
	$coinAnimatedSprite.play("coin animation")
	
func _on_coins_body_entered(body):
	if body.get_name() == 'Player':
		get_node("/root/GlobalCamera/PlayerController").coins += 1
		queue_free()
