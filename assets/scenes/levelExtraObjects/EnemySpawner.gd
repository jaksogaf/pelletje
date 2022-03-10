extends Node

var walkingEnemyLoad = load("res://assets/scenes/player&enemy/WalkingEnemy.tscn")

func _on_EnemySpawnTimer_timeout(): #dit wordt getriggerd als EnemySpawnTimer in level 5 afloopt
	if (get_node("/root/GlobalCamera/PlayerController").spawnerEnemyCount < 20):
		var walkingEnemy = walkingEnemyLoad.instance() 
		var enemyPosition = Vector2(rand_range(690,705), -650) #variatie in x positie van de enemy
		walkingEnemy.position = enemyPosition
		walkingEnemy.spawner = true #deze variabele wordt gebruikt om te bepalen of een enemy ingespawnt is, voor de spawn limiet
		add_child(walkingEnemy) #hiermee word niewe enemy node aangemaakt
		get_node("/root/GlobalCamera/PlayerController").spawnerEnemyCount += 1
