extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var ready = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func fire():
	for bod in $FireRange.get_overlapping_bodies():
		bod.stun(50)

	$CPUParticles2D.speed_scale=1
	$CooldownTimer.start()
	$Polygon2D.visible = false
	pass

func activate():
	ready = false
	$Polygon2D.visible = true
	$FireTimer.start()
	pass

func _on_ActivationRange_body_entered(body):
	if(body.is_in_group("player") and ready):
		activate()
	pass # Replace with function body.


func _on_FireTimer_timeout():
	fire()
	pass # Replace with function body.


func _on_CooldownTimer_timeout():
	ready = true
	$CPUParticles2D.speed_scale = 0
	$CPUParticles2D.emitting = true
	pass # Replace with function body.
