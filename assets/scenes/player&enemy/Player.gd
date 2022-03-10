extends KinematicBody2D

# variables
var gravity = 10
var velocity = Vector2.ZERO
var moveVector = Vector2.ZERO
var maxHorizontalSpeed = 110
var horizontalAcceleration = 2500
var playerStartPosition = Vector2.ZERO
var jumpSpeed = 250
var jumpTerminationMultiplier = 5
var jumpCount = 0
var maxJumpCount = 1

# func _ready() wordt eenmalig uitgevoerd op startup
func _ready():
	playerStartPosition = get_position() #de startpositie van de speler

# func _process wordt elke frame uitgevoerd, de delta zorg voor delta aka frame independent 
# aka iemand met hogere refresh rate zal niet sneller gaan
func _process(delta):
	if (position.y > 1250): #de speler in de void wordt automatisch terug geteleporteerd
		enemyColission()
		$AnimatedSprite.flip_h = false
	
	moveVector = movement_vector()
	#deacceleration, je stopt niet instant
	velocity.x += moveVector.x * horizontalAcceleration
	if (moveVector.x == 0):
		velocity.x = lerp(0, velocity.x, 0.85) 
#lerp is een functie voor interpolation, hierdoor deacceleration
#pow is to the power of, wiskunde
	velocity.x = clamp(velocity.x, -maxHorizontalSpeed, maxHorizontalSpeed)
#clamp zorgt ervoor dat de waarde een minimaal en maximum kan hebben
	
	# alleen springen als karakter op de vloer is
	if (moveVector.y < 0 && is_on_floor()):
		$JumpSound.play()
		jumpCount = 0
		velocity.y = moveVector.y * jumpSpeed
		
	# jump goes brrrr
	if (velocity.y < 0 && !Input.is_action_pressed("move_up")):
		velocity.y +=  gravity * jumpTerminationMultiplier
	else:
		velocity.y += gravity
		
	#doublejump
	if (!is_on_floor() && jumpCount < maxJumpCount && Input.is_action_just_pressed("move_up")):
		$JumpSound.play()
		velocity.y = moveVector.y * jumpSpeed * 0.85
		jumpCount += 1
			
		
	velocity = move_and_slide(velocity, Vector2.UP) #moveandslide zorgt voor de uiteindelijke beweging en collisions van een kinematic2D
	
	playerAnimation()
	
func movement_vector():
	#get_action_strength zorgt voor gemakkelijke controller support. Anders kan je gewoon if(Input.is_action_pressed)
	moveVector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	moveVector.y = -1 if Input.is_action_just_pressed("move_up") else 0
	return moveVector
	
func playerAnimation():
	if (!is_on_floor()):
		# met $ verwijs je naar een node in de tree, wil je verwijsen naar Player dan is dat $Player
		$AnimatedSprite.play("jump")
	elif (moveVector.x != 0):
		$AnimatedSprite.play("run")
	else:
		$AnimatedSprite.play("idle")
	#dit flipt de sprites
	if(moveVector.x != 0):
		$AnimatedSprite.flip_h = false if (moveVector.x > 0) else true

func enemyColission(): #deze code wordt uitgevoerd als de speler een enemie vanaf de zijkant raakt
	if (get_node("/root/GlobalCamera/PlayerController").playerHealth > 0):
		get_node("/root/GlobalCamera/PlayerController").playerHealth -= 1
		$HurtSound.play()
		$AnimatedSprite.flip_h = false		
		position = playerStartPosition

func enemyDeath(): #het geluid van de enemy death, dit kan niet bij enemy zelf want die wordt verwijderd voordat het geluid klaar is met afspelen
	$EnemyDeath.play()
	
func coinSound():
	$CoinSound.play()
