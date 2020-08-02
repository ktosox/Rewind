extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var currentJob = "sleep"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func change_job(newJob):
	pass

func scan_for_player():
	if($Body/ScanRange.get_overlapping_bodies().size()>0):
		print("player found!")
	
	pass
	
