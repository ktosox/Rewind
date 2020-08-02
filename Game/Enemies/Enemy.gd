extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var currentJob = "guard"
export var guardQuadrant = 0

var target
var rotation_change =0
# Called when the node enters the scene tree for the first time.
func _ready():

	change_job("guard")
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(currentJob =="hunt"):
		walk(delta)
		$Mech/Body.look_at(target.global_position)
		$Mech/Body.rotate(PI/2)
	pass

func change_job(newJob):
	match newJob :
		"sleep" :
			$JobPatterns.play("Sleep")
		"dissable" :
			$JobPatterns.play("Dissable")
		"hunt"	:
			$JobPatterns.play("Hunt")
			update_path()
		"guard" :
			$JobPatterns.play("Guard"+String(guardQuadrant))
	currentJob = newJob
	
	pass

func scan_for_player():
	var body = $Mech/Body/DetectionRange.get_overlapping_bodies()
	if(body.size()>0):
		target = body[randi()%body.size()]
		change_job("hunt")

		
	pass
	

func walk(delta):
	if(!$Mech/KillRange.overlaps_body(target) ):
		if(!$Mech/Legs/WalkAnimation.current_animation=="Walk"):
			$Mech/Legs/WalkAnimation.play("Walk")
		$Mech.apply_central_impulse( ($Path/Candy.global_position - $Mech.global_position) *2)
		if(($Mech.global_position).distance_to($Path/Candy.global_position)<20):
			$Path/Candy.unit_offset+=delta*0.06
		

	else:
		$Mech/Legs/WalkAnimation.play("Stop")

	pass

func pew_pew():
	print("pew pew")
	pass


func update_path():
	$Path.curve.clear_points()
	$Path/Candy.unit_offset = 0
	var pathPoints = GM.get_path_to_player($Mech.global_position,target.global_position)
	for z in pathPoints :
		$Path.curve.add_point(z-global_position)
	$Line2D.points = $Path.curve.get_baked_points()
	pass

func update_target():
	if !$Mech/TrackRange.get_overlapping_bodies().has(target):
		target=null
		change_job("sleep")
	else:
		update_path()

		pass


func _on_DetectionRange_body_entered(body):
	if(body.is_in_group("player") and currentJob=="guard"):
		$Mech/Body/ScanLight.energy=0
		target = body
		change_job("hunt")
		
	pass # Replace with function body.
