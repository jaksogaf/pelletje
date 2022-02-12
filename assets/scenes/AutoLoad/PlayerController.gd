extends Node

var playerHealth = 3
var score = 0

func _ready():
	pass 


func _process(delta):
	if (playerHealth <= 0):
		get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
		get_node("/root/GlobalCamera").currentLevel = 1
		score = 0
		playerHealth = 3
