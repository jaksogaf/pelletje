extends Node

var playerHealth = 30
var score = 0
var coins = 0
var spawnerEnemyCount = 0

func _ready():
	pass 


func _process(delta):	
	if(Input.is_action_just_pressed("ui_cancel")):
		get_tree().quit()
	
	if (playerHealth <= 0):
		playerDeath()
	if (get_node("/root/GetLevels").currentLevel <= 0):
		get_node("/root/GlobalCamera/Hud/UI").visible = false
	elif (get_node("/root/GetLevels").currentLevel > 0):
		get_node("/root/GlobalCamera/Hud/UI").visible = true
		get_node("/root/GlobalCamera/Hud/UI/HealthUI/HealthFull").rect_size.x = playerHealth * 15

func playerDeath():
	get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
	get_node("/root/GetLevels").currentLevel = 1
	score = 0
	coins = 0
	playerHealth = 3
	spawnerEnemyCount = 0
