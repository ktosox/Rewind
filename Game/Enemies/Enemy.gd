extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var currentJob = "guard"
export var guardQuadrant = 0

var target

# Called when the node enters the scene tree for the first time.
func _ready():
	change_job("guard")
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(currentJob =="hunt"):
		$Body.look_at(target.global_position)
		$Body.rotate(PI/2)
	pass

func change_job(newJob):
	match newJob :
		"sleep" :
			$JobPatterns.play("Sleep")
		"dissable" :
			$JobPatterns.play("Dissable")
		"hunt"	:
			$JobPatterns.play("Hunt")
		"guard" :
			$JobPatterns.play("Guard"+String(guardQuadrant))
	currentJob = newJob
	
	pass

func scan_for_player():
	var body = $Body/ScanRange.get_overlapping_bodies()
	if(body.size()>0):
		change_job("hunt")
		target = body[randi()%body.size()]
	pass
	

func pew_pew():
	print("pew pew")
	pass


func update_target():
	if !$TrackRange.get_overlapping_bodies().has(target):
		target=null
		change_job("sleep")

func _on_ScanRange_body_entered(body):
	if(body.is_in_group("player") and currentJob=="guard"):
		$Body/ScanLight.energy=0
		change_job("hunt")
		target = body
	pass # Replace with function body.
