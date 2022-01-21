extends KinematicBody2D

# variables
var gravity = 700
var velocity = Vector2.ZERO
var moveVector = Vector2.ZERO
var maxHorizontalSpeed = 110
var horizontalAcceleration = 2500
var jumpSpeed = 400
var jumpHeldMultiplier = 5

# func _ready() wordt eenmalig uitgevoerd op startup
func _ready():
	pass 

# func _process wordt elke frame uitgevoerd, de delta zorg voor delta aka frame independent 
# aka iemand met hogere refresh rate zal niet sneller gaan
func _process(delta):
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y =-1 if Input.is_action_just_pressed("move_up") else 0
	
	# deacceleration, je stopt niet instant
	velocity.x += moveVector.x * horizontalAcceleration * delta
	if (moveVector.x == 0):
		velocity.x = lerp(0, velocity.x, pow(2, -75 * delta))
	velocity.x = clamp(velocity.x, -maxHorizontalSpeed, maxHorizontalSpeed)
	
	# alleen springen als karakter op de vloer is
	if (moveVector.y < 0 && is_on_floor()):
		velocity.y = moveVector.y * jumpSpeed
		
	# jump goes brrrr
	if (velocity.y < 0 && !Input.is_action_pressed("move_up")):
		velocity.y +=  gravity * jumpHeldMultiplier * delta
	else:
		velocity.y += gravity * delta
		
	velocity = move_and_slide(velocity, Vector2.UP)
