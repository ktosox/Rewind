extends Node2D

var itemTypes = {
	4 : ["player_buff",],
	
}
 


export var itemID = 0 # 0 leads to random item generated on drop / anythin outside of ransge becomes 0



func _ready():
	#randomize ID if 0
	update_drop()
	pass # Replace with function body.


func update_drop():
	#get item data from array
	#set texture
	pass


func _on_PickUp_body_entered(body):
	$Animator.play("Grab")
	pass # Replace with function body.
