extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentPlayer
var currentLevel
var currentOverlay
export var currentProgress = 0
export var maxCaptures = 45

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


func get_path_to_player(start,end):
	return currentLevel.get_simple_path(currentLevel.get_closest_point(start),currentLevel.get_closest_point(end), true)
	pass


