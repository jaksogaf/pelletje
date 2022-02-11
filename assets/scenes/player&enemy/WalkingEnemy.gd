extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 35
var speed = 35
var direction = 1
var colliderLeft = 0
var colliderRight = 0

func _ready():
	pass 

# warning-ignore:unused_argument
func _process(delta):

	velocity.y = gravity
	colliderLeft = $RayCastLeft.get_collider()
	colliderRight = $RayCastRight.get_collider()
	
	if (is_on_floor()):
		velocity.x = speed * direction
		if (colliderLeft == null || colliderRight == null):
			direction = direction * -1
			position.x += 2 * direction
			
	velocity = move_and_slide(velocity, Vector2(0,-1))
	
	if (direction == -1):
		$WalkingEnemySprite.flip_h = false
	elif (direction == 1):
		$WalkingEnemySprite.flip_h = true


func _on_WEDArea_body_entered(body):
	if body.get_name() == 'Player':
		queue_free()
