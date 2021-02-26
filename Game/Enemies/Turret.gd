extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var startJob
export var currentJob = "guard"

var target
var rotation_change =0
# Called when the node enters the scene tree for the first time.
func _ready():
	GM.add_rst_object(self)
	startJob = currentJob
	change_job(currentJob)
	pass # Replace with function body.

func _process(delta):
	if(currentJob =="hunt"):
		$Head.look_at(target.global_position)
		$Head.rotate(PI/2)
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
			$JobPatterns.play("Guard")
	currentJob = newJob
	
	pass

func scan_for_player():
	var body = $Head/DetectionCone.get_overlapping_bodies()
	if(body.size()>0):
		target = body[randi()%body.size()]
		change_job("hunt")

func update_target():
	if !$TrackingRange.get_overlapping_bodies().has(target):
		target=null
		change_job(startJob)

func pew_pew():
	$Head/Gun.fire()
	pass

func reset():
	print("ima reset")
	$Head.rotation = 0
	$JobPatterns.play(startJob)
	pass

func _on_DetectionCone_body_entered(body):
	if(body.is_in_group("player") and currentJob=="guard"):
		$Head/ScanLight.energy=0
		target = body
		change_job("hunt")
		
