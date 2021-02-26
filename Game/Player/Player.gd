extends KinematicBody2D

var playerDecoyScene = preload("res://Player/PlayerDecoy.tscn")

var missileAttackScene = preload("res://Player/MissileAttack.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var recovery = 0.06
export var canMove = true
var pastDir = Vector2(0,0)
export var moveSpeed = 4.0
export var bonusSpeed = 50.0
export var stunSpeed = 1.0

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.currentPlayer = self
	pass # Replace with function body.

func get_input():
	var dir = Vector2(0,0)
	dir.x = int(Input.is_action_pressed("ui_right") ) - int(Input.is_action_pressed("ui_left") )
	dir.y = int(Input.is_action_pressed("ui_down") ) - int(Input.is_action_pressed("ui_up") ) 
	dir = dir.normalized()
	if(!canMove):
		return Vector2(0,0)
	return dir
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if(event.is_action_pressed("ui_accept")):
		var newBul = missileAttackScene.instance()
		newBul.global_position = global_position
		newBul.global_rotation = global_rotation
		get_parent().add_child(newBul)

func stun(stonk):
	print("stunned!")
	stunSpeed /=stonk
	pass

func reset_stats():
	moveSpeed = 2.0
	bonusSpeed = 50.0
	stunSpeed = 1.0
	pass

func _physics_process(delta):
	if (stunSpeed<1.0):
		stunSpeed+=delta * ( recovery/stunSpeed )
		stunSpeed = min(stunSpeed,1.0)
		
	var playerDir = get_input()
	if(playerDir!=Vector2(0,0)):
		rotation = Vector2(0,0).angle_to_point(playerDir)  - PI/2
	
	if(playerDir==Vector2(0,0)):
		if(moveSpeed>0):
			moveSpeed = max(moveSpeed-(delta*8),0)

	if(pastDir!=playerDir):
		if(abs(pastDir.x+playerDir.x)+abs(pastDir.y+playerDir.y) <2):
			$ChangeSpeed.play("Shift")
			print(abs(pastDir.x+playerDir.x)," : ",abs(pastDir.y+playerDir.y) )
#	if(abs(pastDir.direction_to(playerDir).x)>0.7 or abs(pastDir.direction_to(playerDir).y)>0.7 ):
##		print(pastDir.direction_to(playerDir))
#		
#		print(abs(pastDir.direction_to(playerDir).x)," : ",abs(pastDir.direction_to(playerDir).y))
#
#	print(moveSpeed+bonusSpeed)
	var colision = move_and_collide(delta*(playerDir+pastDir*0.7)*(moveSpeed*bonusSpeed*stunSpeed),false )
	if(playerDir == Vector2(0,0)):
		pastDir *= 0.75
		if(pastDir.length()<0.05):
			pastDir = Vector2(0,0)
	else:
		pastDir = playerDir
	

	if (colision != null):
		if(colision.collider.is_in_group("props")):
#		$ChangeSpeed.play("Bump")
			var offset = global_position-colision.collider.global_position
			colision.collider.apply_impulse(offset,-colision.normal * moveSpeed*bonusSpeed)
	pass
	


func _on_Timer_timeout():
#	print(moveSpeed,pastDir)
	pass # Replace with function body.
