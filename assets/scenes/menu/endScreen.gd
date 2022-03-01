extends Node2D

var elapsedTime = 0
var minutes = 0
var seconds = 0
var zero = ""
var score = 0

var bestTime = 0
var bestMinutes = 0
var bestSeconds = 0
var bestZero = ""
var bestScore = 0


func _ready():
	get_node("/root/GlobalCamera").global_position = Vector2.ZERO
	score = get_node("/root/GlobalCamera/PlayerController").score

	saveScore()
	time()

	$Current/CurrentTimeText.text = str(minutes , ":", zero , seconds)
	$Current/CurrentScoreText.text = str(score)
	$Best/BestTimeText.text = str(bestMinutes , ":", bestZero , bestSeconds)
	$Best/BestScoreText.text = str(bestScore)

func _process(delta):	
	if (Input.is_action_just_pressed("move_up")):
		get_node("/root/GlobalCamera/PlayerController").score = 0
		get_node("/root/GlobalCamera/PlayerController").playerHealth = 3
		get_node("/root/GlobalCamera/Hud/Timer").elapsedTime = 0.0
		get_node("/root/GetLevels").currentLevel = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
		
func saveScore():
	var saveScore = File.new()
	
	var scoreData = {
		"highScore": score,
		"bestTime": elapsedTime
	}
	
	if !saveScore.file_exists("user://score.save"):
		saveScore.open("user://score.save", File.WRITE)
		saveScore.store_line(to_json(scoreData))
		saveScore.close()
	else:
		saveScore.open("user://score.save", File.READ)
		bestTime = scoreData.bestTime
		bestScore = scoreData.highScore
		if (scoreData.highScore < score):
			scoreData.highScore = score
		if (scoreData.bestTime > elapsedTime):
			scoreData.bestTime = elapsedTime	
		saveScore.close()
		saveScore.open("user://score.save", File.WRITE)
		saveScore.store_line(to_json(scoreData))

func time():
	#current Time
	elapsedTime = get_node("/root/GlobalCamera/Hud/Timer").elapsedTime
	minutes = int(elapsedTime/60)
	seconds = int(fmod(elapsedTime, 60))
	if (seconds < 10):
		zero = "0"
	else:
		zero = ""

	#best Time
	bestMinutes = int(bestTime/60)
	bestSeconds = int(fmod(bestTime, 60))
	if (bestSeconds < 10):
		bestZero = "0"
	else:
		bestZero = ""
