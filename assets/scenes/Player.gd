extends KinematicBody2D

# variables
var gravity = 750
var velocity = Vector2.ZERO
var moveVector = Vector2.ZERO
var maxHorizontalSpeed = 110
var horizontalAcceleration = 2500
var jumpSpeed = 300
var jumpTerminationMultiplier = 5
var playerStartPosition = Vector2.ZERO
var jumpCount = 0
var maxJumps = 2

# func _ready() wordt eenmalig uitgevoerd op startup
func _ready():
	playerStartPosition = get_position()
	print(playerStartPosition)
	$AnimatedSprite.flip_h = true

# func _process wordt elke frame uitgevoerd, de delta zorg voor delta aka frame independent 
# aka iemand met hogere refresh rate zal niet sneller gaan
func _process(delta):
	if (position.y > 500):
		position = playerStartPosition
	
	moveVector = movement_vector()
	# deacceleration, je stopt niet instant
	velocity.x += moveVector.x * horizontalAcceleration * delta
	if (moveVector.x == 0):
		velocity.x = lerp(0, velocity.x, pow(2, -50 * delta))
	velocity.x = clamp(velocity.x, -maxHorizontalSpeed, maxHorizontalSpeed)
	
	# alleen springen als karakter op de vloer is
	if (moveVector.y < 0 && is_on_floor()):
		velocity.y = moveVector.y * jumpSpeed
		
	# jump goes brrrr
	if (velocity.y < 0 && !Input.is_action_pressed("move_up")):
		velocity.y +=  gravity * jumpTerminationMultiplier * delta
	else:
		velocity.y += gravity * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)
	
	playerAnimation()
	
func movement_vector():
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y =-1 if Input.is_action_just_pressed("move_up") else 0
	return moveVector
	
func playerAnimation():
	var animationMoveVector = movement_vector()
	
	if (!is_on_floor()):
		# met $ verwijs je naar een node in de tree, wil je verwijsen naar Player dan is dat $Player
		$AnimatedSprite.play("jump")
	elif (animationMoveVector.x != 0):
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	
	if(animationMoveVector.x != 0):
		$AnimatedSprite.flip_h = true if (animationMoveVector.x > 0) else false
