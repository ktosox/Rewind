extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target
var elapsed = 0
var speed = 0.0005

# Called when the node enters the scene tree for the first time.
func _ready():
	target = $Line2D.points
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for z in $CPUParticles2D.emission_points.size():
		$CPUParticles2D.emission_points[z] =  lerp($CPUParticles2D.emission_points[z], target[z],min(1.0,elapsed) )
		elapsed+=delta*speed
	pass

func spread():
	target = $CPUParticles2D.emission_points
	for t in target.size() :
		target[t]+= Vector2(600*(randf()-0.5),(randf()-0.5)*600)
	elapsed = 0
	pass

func collapse():
	target = $CPUParticles2D.emission_points
	for t in target.size() :
		target[t]= Vector2(6*(randf()-0.5),(randf()-0.5)*6)
	elapsed = 0
	pass


func _on_Button_pressed():
	collapse()
	pass # Replace with function body.
