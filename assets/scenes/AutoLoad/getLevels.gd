extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lvlPaths = []
var location = "res://assets/scenes/levels/"
var dir = Directory.new()
var currentLevel = 0

func levelsPaths():
	if dir.open(location) == OK:
		dir.list_dir_begin()
		var current = dir.get_next()
		while current != "":
			if current.begins_with("level") and not (location+current) in lvlPaths:
				lvlPaths.append((location+current))
			current = dir.get_next()
		lvlPaths.sort()
		return lvlPaths
	else:
		return dir.open(location)
