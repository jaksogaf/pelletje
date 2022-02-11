extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 10
var speed = 25
var direction = 1
var colliderLeft = 0
var colliderRight = 0



func _ready():
	pass 


func _process(delta):
	velocity.y = gravity
	colliderLeft = $RayCastLeft.get_collider()
	colliderRight = $RayCastRight.get_collider()
	
	if (is_on_floor()):
		velocity.x = speed * direction
		if (colliderLeft == null || colliderRight == null):
			direction = direction * -1
			velocity.x += 45 * direction

	velocity = move_and_slide(velocity, Vector2(0,-1))
