extends Node

#deze code laad automatisch het volgende level, ongeacht hoeveel levels er zijn.
var lvlPaths = []
var location = "res://assets/scenes/levels/"
var dir = Directory.new()
var currentLevel = 0 #deze variable wordt in andere stukken code gebruikt.

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
