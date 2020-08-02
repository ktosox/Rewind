extends Navigation2D

export var level_ID = 0

var isRewinding = false

var screenCaptures = []
var cameraCaptures = []


# Called when the node enters the scene tree for the first time.
func _ready():

	GM.currentLevel = self
	pass # Replace with function body.

func _input(event):
	if(event.is_action_pressed("ui_accept")):
		toggle_rewind()

func play_rewind():
	if(screenCaptures.size()>0):
		var tex = ImageTexture.new()
		$Watcher.global_position = cameraCaptures.pop_back()
		tex.create_from_image(screenCaptures.pop_back())
		$RewindLayer/ReplayScreen.texture = tex
	else:
		end_rewind()

func toggle_rewind():
	if(isRewinding):
		if($RewindLayer/ScreenRewinder.is_playing()):
			$RewindLayer/ScreenRewinder.stop()
			GM.currentOverlay.toggle_bars()
		else:
			$RewindLayer/ScreenRewinder.play("Rewind")
			GM.currentOverlay.toggle_bars()
	
	pass

func end_rewind():
	
	isRewinding = false
	$RewindLayer/ReplayScreen.visible = false
	$RewindLayer/ScreenRewinder.stop()
	$CaptureRate.start()
	GM.currentPlayer.toggle_camera()
	$RewindLayer/ReplayScreen.texture = null
	pass

func start_rewind():
	GM.currentProgress = 0
	isRewinding = true
	$RewindLayer/ReplayScreen.visible = true
	$RewindLayer/ScreenRewinder.play("Rewind")
	$CaptureRate.stop()
	GM.currentPlayer.toggle_camera()
	$Watcher.global_position = GM.currentPlayer.global_position
	$Watcher.current=true
	pass


func _on_CaptureRate_timeout():
	GM.currentProgress +=1
	var camera = GM.currentPlayer.global_position
	var screen = get_viewport().get_texture().get_data()
	screen.flip_y()
	screen.resize(640,360)
	screenCaptures.append(screen)
	cameraCaptures.append(camera)
	print(screenCaptures.size())
	if(screenCaptures.size()>GM.maxCaptures):
		start_rewind()



