extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var followPlayer = true
export var followMargin = Vector2(640,360)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(followPlayer):
		var player_pos = GM.currentPlayer.global_position
		if abs(global_position.x - player_pos.x) >followMargin.x :
			global_position.x -= 2*followMargin.x*sign(global_position.x - player_pos.x)
		if abs(global_position.y - player_pos.y) >followMargin.y :
			global_position.y -= 2*followMargin.y*sign(global_position.y - player_pos.y)
	pass
