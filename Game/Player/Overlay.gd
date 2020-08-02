extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var barsHidden = true

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.currentOverlay = self
	$ProgressBar.max_value = GM.maxCaptures-1
	pass # Replace with function body.

func toggle_bars():
	if(barsHidden):
		$Layout/AnimationPlayer.play("RollBars")
		barsHidden = false
	else:
		$Layout/AnimationPlayer.play("HideBars")
		barsHidden = true
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(GM.currentProgress == 0):
		$ProgressBar.value=0
	if($ProgressBar.value < GM.currentProgress):
		$ProgressBar.value+=delta
		$ProgressBar.value = min(GM.currentProgress,$ProgressBar.value)
	pass
