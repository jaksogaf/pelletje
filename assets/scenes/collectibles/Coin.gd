extends Area2D


# warning-ignore:unused_argument
func _process(delta):
	$coinAnimatedSprite.play("coin animation")
	
func _on_coins_body_entered(body):
	if body.get_name() == 'Player':
		body.coinSound()
		get_node("/root/GlobalCamera/PlayerController").coins += 1
		get_node("/root/GlobalCamera/PlayerController").score += 5
		queue_free()
