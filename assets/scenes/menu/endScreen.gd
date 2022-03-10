extends Node2D
#scores van deze run
var elapsedTime = 0
var minutes = 0
var seconds = 0
var zero = ""
var score = 0
#scores van beste run
var bestTime = 0
var bestMinutes = 0
var bestSeconds = 0
var bestZero = ""
var bestScore = 0


func _ready():
	get_node("/root/GlobalCamera").global_position = Vector2.ZERO #camera terug zetten
	score = get_node("/root/GlobalCamera/PlayerController").score
	elapsedTime = get_node("/root/GlobalCamera/Hud/UI/Timer").elapsedTime
	
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
		get_node("/root/GlobalCamera/Hud/UI/Timer").elapsedTime = 0.0
		get_node("/root/GetLevels").currentLevel = 1
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		get_tree().change_scene("res://assets/scenes/levels/level1.tscn")
		get_node("/root/MusicController").switch = true
		
func saveScore():
	#code voor het opslaan van de tijd en score, in json formaat
	var saveScore = File.new()
	
	var scoreData = {
		"highScore": score,
		"bestTime": elapsedTime
	}
	
	if !saveScore.file_exists("user://score.save"): #bestaat de file niet, dan aanmaken
		saveScore.open("user://score.save", File.WRITE)
		scoreData.bestTime = elapsedTime
		saveScore.store_line(to_json(scoreData))
		saveScore.close()
	else:
		saveScore.open("user://score.save", File.READ)
		if (scoreData.highScore < score):
			scoreData.highScore = score
		if(scoreData.bestTime == 0):
			scoreData.bestTime = elapsedTime
		elif (scoreData.bestTime > elapsedTime):
			scoreData.bestTime = elapsedTime
		bestTime = scoreData.bestTime
		bestScore = scoreData.highScore
		print("bestTime ", bestTime)
		saveScore.close()
		saveScore.open("user://score.save", File.WRITE)
		saveScore.store_line(to_json(scoreData))

func time():
	#current Time
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
