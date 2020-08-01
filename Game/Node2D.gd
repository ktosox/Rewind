extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var screenCaptures = []
export var maxCaptures = 600
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func show_past():
	$ReplayScreen.visible = true
	if(screenCaptures.size()>0):
		var tex = ImageTexture.new()
		tex.create_from_image(screenCaptures.pop_back())
		
		$ReplayScreen.texture = tex
	else:
		$ReplayScreen.visible = false
		$AnimationPlayer.stop()
		$Timer.start()
		$Timer2.start()
		$CPUParticles2D.speed_scale = 1
	pass


func _on_Button_pressed():
	$Timer.stop()
	$Timer2.stop()
	$CPUParticles2D.speed_scale = 0
	$AnimationPlayer.play("rewind")
	pass # Replace with function body.


func _on_Timer_timeout():
	var screen = get_viewport().get_texture().get_data()
	screen.flip_y()
	screenCaptures.append(screen)
	if(screenCaptures.size()>maxCaptures):
		screenCaptures.pop_front()
	print(screenCaptures.size())
	pass # Replace with function body.


func _on_Timer2_timeout():
	var time = int($Label.text)
	$Label.text = String(time+1)
	pass # Replace with function body.
