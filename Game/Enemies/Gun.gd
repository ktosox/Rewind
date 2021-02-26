extends Sprite

var bullet_scene = preload("res://Enemies/Bullet.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire():
	var bullet = bullet_scene.instance()
	var pos = [$Left.global_position,$Right.global_position]
	bullet.global_position = pos[randi()%2]
	bullet.global_rotation= self.global_rotation
	GM.currentLevel.add_child(bullet)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
