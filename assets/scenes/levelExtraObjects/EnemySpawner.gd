extends Node

var walkingEnemyLoad = load("res://assets/scenes/player&enemy/WalkingEnemy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_EnemySpawnTimer_timeout():
	if (get_node("/root/GlobalCamera/PlayerController").spawnerEnemyCount <20):
		var walkingEnemy = walkingEnemyLoad.instance()
		var enemyPosition = Vector2(rand_range(690,705), -650)
		walkingEnemy.position = enemyPosition
		walkingEnemy.spawner = true
		add_child(walkingEnemy)
		get_node("/root/GlobalCamera/PlayerController").spawnerEnemyCount += 1
