extends Node2D

var elapsedTime = 0
var minutes = 0
var seconds = 0
var zero = ""
var score = 0

func _ready():
	get_node("/root/GlobalCamera").global_position = Vector2.ZERO
	
	elapsedTime = get_node("/root/GlobalCamera/Hud/Timer").elapsedTime
	minutes = int(elapsedTime/60)
	seconds = int(fmod(elapsedTime, 60))
	score = get_node("/root/GlobalCamera/PlayerController").score

func _process(delta):
	if (seconds < 10):
		zero = "0"
	else:
		zero = ""
	$TimeText.text = str( minutes , ":", zero , seconds)
	$ScoreText.text = str(score)
	if (Input.is_action_just_pressed("move_up")):
		get_node("/root/GlobalCamera/PlayerController").score = 0
		get_node("/root/GlobalCamera/PlayerController").playerHealth = 3
		get_node("/root/GlobalCamera/Hud/Timer").elapsedTime = 0.0
		get_node("/root/GlobalCamera").currentLevel = 1
		get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
