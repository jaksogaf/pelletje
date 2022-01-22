extends Node2D

var elapsedTime = 0.0
var minutes = 0
var seconds = 0
onready var timerText = $Timer

func _process(delta):
	elapsedTime += delta
	minutes = int(elapsedTime/60)
	seconds = int(fmod(elapsedTime, 60))
	if (seconds > 60):
		seconds = 0
	timerText.text = str(minutes , seconds)
