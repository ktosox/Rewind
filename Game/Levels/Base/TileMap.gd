extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	load_grass(get_used_cells_by_id(4))
	load_floor(get_used_cells_by_id(3))
	load_path(get_used_cells_by_id(1))
	load_lab_floor_Teal(get_used_cells_by_id(10))
	load_lab_floor_Blue(get_used_cells_by_id(18))
	load_lab_floor_Green(get_used_cells_by_id(11))
	load_lab_floor_Purple(get_used_cells_by_id(9))
	load_lab_edge_left(get_used_cells_by_id(14))
	load_lab_edge_right(get_used_cells_by_id(15))
	load_lab_edge_bot(get_used_cells_by_id(16))
	pass # Replace with function body.


func load_lab_edge_bot(tileRange):
	for f in tileRange :
		var tiles = [Vector2(1,0),Vector2(0,0)]
		set_cell(f.x,f.y,16,bool(randi()%2),false,false,tiles[randi()%2])

func load_lab_edge_left(tileRange):
	for f in tileRange :
		var tiles = [Vector2(1,0), Vector2(2,0),Vector2(0,0)]
		set_cell(f.x,f.y,14,false,bool(randi()%2),false,tiles[randi()%3])

func load_lab_edge_right(tileRange):
	for f in tileRange :
		var tiles = [Vector2(1,0), Vector2(2,0),Vector2(0,0)]
		set_cell(f.x,f.y,15,false,bool(randi()%2),false,tiles[randi()%3])


func load_lab_floor_Teal(tileRange):
	for f in tileRange :
		var specialTiles = [Vector2(0,1), Vector2(0,2),Vector2(0,3)]
		var tile = Vector2(0,0)
		if(randi()%5!=1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(f.x,f.y,10,bool(randi()%2),false,false,tile)
	pass

func load_lab_floor_Blue(tileRange):
	for f in tileRange :
		var specialTiles = [Vector2(0,0),Vector2(1,0), Vector2(2,0)]
		var tile = Vector2(3,0)
		if(randi()%14==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(f.x,f.y,18,false,false,bool(randi()%2),tile)
	pass
	
func load_lab_floor_Green(tileRange):
	for f in tileRange :
		var specialTiles = [Vector2(0,1), Vector2(0,2),Vector2(0,3)]
		var tile = Vector2(0,0)
		if(randi()%7!=1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(f.x,f.y,11,false,false,bool(randi()%2),tile)
	pass
	
func load_lab_floor_Purple(tileRange):
	for f in tileRange :
		var specialTiles = [Vector2(0,1), Vector2(0,2),Vector2(0,3)]
		var tile = Vector2(0,0)
		if(randi()%5==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(f.x,f.y,9,bool(randi()%2),false,bool(randi()%2),tile)
	pass

func load_grass(tileRange):
	for g in tileRange :
		var specialTiles = [Vector2(1,0),Vector2(0,1), Vector2(0,2),Vector2(0,3),Vector2(1,1),Vector2(1,2),Vector2(1,3) ]
		var tile = Vector2(0,0)
		if(randi()%3==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(g.x,g.y,4,bool(randi()%2),false,false,tile)
	pass

func load_path(tileRange):
	for p in tileRange :
		var specialTiles = [Vector2(1,0),Vector2(2,0) ]
		var tile = Vector2(0,0)
		if(randi()%3==1):
			tile = specialTiles[randi()%specialTiles.size()]
		set_cell(p.x,p.y,1,bool(randi()%2),bool(randi()%2),bool(randi()%2),tile)
	pass

func load_floor(tileRange):
	for t in tileRange:
		var specialTiles = [Vector2(0,0),Vector2(2,0),Vector2(3,0)]
		var tile = Vector2(1,0)
		if(randi()%8==1):
			tile = specialTiles[randi()%specialTiles.size()]
			
		set_cell(t.x,t.y,3,false, false,bool(randi()%2),tile)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
