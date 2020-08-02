extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pastDir = Vector2(0,0)
export var moveSpeed = 2.0
export var bonusSpeed = 40.0

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
	var playerDir = get_input()

	if(abs(pastDir.direction_to(playerDir).x)>0.99 or abs(pastDir.direction_to(playerDir).y)>0.99 ):
#		print(pastDir.direction_to(playerDir))
		$ChangeSpeed.play("Shift")
	pastDir = playerDir
#	print(moveSpeed+bonusSpeed)
	var colision = move_and_collide(delta*playerDir*(moveSpeed*bonusSpeed),false )
	if (colision != null):
		if(colision.collider.is_in_group("props")):
#		$ChangeSpeed.play("Bump")
			var offset = global_position-colision.collider.global_position
			colision.collider.apply_impulse(offset,-colision.normal * moveSpeed*bonusSpeed)
	pass
