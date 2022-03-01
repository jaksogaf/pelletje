extends KinematicBody2D

var velocity = Vector2.ZERO
var gravity = 35
var speed = 35
var direction = 1
var colliderLeft = 0
var colliderRight = 0
var spawner = false

func _ready():
	pass 

# warning-ignore:unused_argument
func _process(delta):

	velocity.y = gravity
	colliderLeft = $RayCastLeft.get_collider() 	#Raycast aan allebei de kanten van de enemy, zodat de enemy op tijd om kan keren
	colliderRight = $RayCastRight.get_collider()
	
	if (is_on_floor()):
		$WalkingEnemySprite.play('walk')
		velocity.x = speed * direction
		if (colliderLeft == null || colliderRight == null): #enemy keert om als een van de raycasts de grond niet meer raakt
			direction = direction * -1
			position.x += 2*direction #de enemy wordt 2 (pixels?) geteleporteert naar nieuwe directie, zonder keert de enemy continu om (bug)
	elif (!is_on_floor()): #code zodat de enemy kan vallen, wordt nergens gebruikt maar als we enemy verkeerd plaatsen is het handig
			if (colliderLeft == null && colliderRight == null):
				velocity.y += gravity
				
	if (is_on_wall()): #de enemy keert om als deze een muur aan raakt
		direction = direction *-1
		position.x += 2*direction
			
	velocity = move_and_slide(velocity, Vector2.UP) #hierdoor beweegt de enemy
	
	if (direction == -1): #code voor de animatie
		$WalkingEnemySprite.flip_h = false
	elif (direction == 1):
		$WalkingEnemySprite.flip_h = true


func _on_WEDArea_body_entered(body): #WalkingEnemyDeath, de enemy sterft
	if body.get_name() == 'Player':
		get_node("/root/GlobalCamera/PlayerController").score += 10
		if (spawner == true):
			get_node("/root/GlobalCamera/PlayerController").spawnerEnemyCount -= 1
		queue_free()


func _on_WEPDArea_body_entered(body): #WalkingEnemyPlayerDeath, de player sterft
		if body.get_name() == 'Player':
			body.enemyColission() #hierdoor wordt de functie enemyColission() in de player uitgevoerd
