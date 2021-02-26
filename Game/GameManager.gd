extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var currentPlayer
var currentLevel
var currentOverlay
export var currentProgress = 0
export var maxCaptures = 15
var transTex
var restartableObjects = []

var pickupList = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


func get_path_to_player(start,end):
	return currentLevel.get_simple_path(currentLevel.get_closest_point(start),currentLevel.get_closest_point(end), true)
	pass

func add_rst_object(obs):
	restartableObjects.push_back(obs)
	pass

func reset_level():
	for o in restartableObjects :
		o.reset()
	pass

func start_level(callerID,screen):
	print("loading level ",String(callerID+1), "!")
	transTex = screen
	# use screen for transition
	pass
