extends Node2D
export var grid: Resource

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var board = $board
onready var camera = $Camera2D
func _ready():
	# 
	var viewport_size = get_viewport().size # [x, y]
	var tile_rec = board.get_used_rect()
	var tile_size = board.cell_size
	var tilemap_size  = Vector2(
		tile_rec.end.x - tile_rec.position.x,
		tile_rec.end.y - tile_rec.position.y
	)
	
	var level_size = Vector2(tile_size * tilemap_size)
	print(level_size)
	camera.set_zoom(level_size / viewport_size)
	
func _input(event):
	if event is InputEventMouseButton:
		var tile_pos = board.map_to_world(board.world_to_map(board.make_input_local(event).position))
		print(grid.grid_coords(tile_pos))
