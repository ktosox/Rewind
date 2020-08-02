extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_grass(get_used_cells_by_id(4))
	load_floor(get_used_cells_by_id(3))
	load_path(get_used_cells_by_id(1))
	pass # Replace with function body.

func load_grass(tileRange):
	for g in tileRange :
		var specialTiles = [Vector2(1,0),Vector2(0,1), Vector2(0,2),Vector2(0,3),Vector2(1,1),Vector2(1,2),Vector2(1,3) ]
		var tile = Vector2(0,0)
		if(randi()%3==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(g.x,g.y,4,false,false,false,tile)
	pass

func load_path(tileRange):
	for p in tileRange :
		var specialTiles = [Vector2(1,0),Vector2(2,0) ]
		var tile = Vector2(0,0)
		if(randi()%3==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(p.x,p.y,1,bool(randi()%2),bool(randi()%2),false,tile)
	pass

func load_floor(tileRange):
	for t in tileRange:
		var specialTiles = [Vector2(0,0),Vector2(2,0),Vector2(3,0)]
		var tile = Vector2(1,0)
		if(randi()%8==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(t.x,t.y,3,bool(randi()%2),bool(randi()%2),false,tile)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
