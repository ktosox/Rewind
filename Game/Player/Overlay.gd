extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$ProgressBar.max_value = GM.maxCaptures-1
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(GM.currentProgress == 0):
		$ProgressBar.value=0
	if($ProgressBar.value < GM.currentProgress):
		$ProgressBar.value+=delta
		$ProgressBar.value = min(GM.currentProgress,$ProgressBar.value)
	pass
