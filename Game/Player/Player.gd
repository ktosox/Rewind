extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_input():
	var dir = Vector2(0,0)
	dir.x = int(Input.is_action_pressed("ui_right") ) - int(Input.is_action_pressed("ui_left") )
	dir.y = int(Input.is_action_pressed("ui_down") ) - int(Input.is_action_pressed("ui_up") ) 
	dir = dir.normalized()
	return dir
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var player_dir = get_input()
	move_and_collide(player_dir)
	pass
