extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	apply_central_impulse(Vector2(0,-1).rotated(global_rotation+randf()*0.18)*400)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func die():
	$Pixel_Particle_2.visible=false
	$CPUParticles2D.speed_scale=1
	dead = true
	$TimerDeath.start()
	pass

func _on_Bullet_body_entered(body):
	if(body.is_in_group("player")):
		print("hit")
	die()
	pass # Replace with function body.


func _on_TimerDeath_timeout():
	self.queue_free()
	pass # Replace with function body.


func _on_TimerLife_timeout():
	if(!dead):
		die()
	pass # Replace with function body.
