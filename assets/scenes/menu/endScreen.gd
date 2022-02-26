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
	saveScore()

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
		get_node("/root/GetLevels").currentLevel = 1
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
		if (scoreData.highScore < score):
			scoreData.highScore = score
			$ScoreText.add_color_override("selection_color", Color(255,255,0))
		else:
			$ScoreText.add_color_override("selection_color", Color(255,255,255))
		if (scoreData.bestTime > elapsedTime):
			scoreData.bestTime = elapsedTime
			$TimeText.add_color_override("selection_color", Color(255,255,0))
		else:
			$TimeText.add_color_override("selection_color", Color(255,255,255))
		saveScore.close()
		saveScore.open("user://score.save", File.WRITE)
		saveScore.store_line(to_json(scoreData))
		
