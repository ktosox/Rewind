extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenCaptures = []
export var maxCaptures = 300
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if(event.is_action("LMB") ) :
		$icon.global_position = get_global_mouse_position()
		pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Camera2D.position.x-=delta*16
	pass
func show_past():
	$CanvasLayer/ReplayScreen.visible = true
	if(screenCaptures.size()>0):
		var tex = ImageTexture.new()
		tex.create_from_image(screenCaptures.pop_back())
		
		$CanvasLayer/ReplayScreen.texture = tex
	else:
		$CanvasLayer/ReplayScreen.visible = false
		$AnimationPlayer.stop()
		$Timer.start()
		$Timer2.start()
		$Camera2D.position.x = 0
		$Label.text = "0"
	pass


func _on_Button_pressed():
	$Timer.stop()
	$Timer2.stop()
	$AnimationPlayer.play("rewind")
	pass # Replace with function body.


func _on_Timer_timeout():
	var screen = get_viewport().get_texture().get_data()
	screen.flip_y()
	screenCaptures.append(screen)
	if(screenCaptures.size()>maxCaptures):
		_on_Button_pressed()
	print(screenCaptures.size())
	pass # Replace with function body.


func _on_Timer2_timeout():
	var time = int($Label.text)
	$Label.text = String(time+1)
	pass # Replace with function body.
