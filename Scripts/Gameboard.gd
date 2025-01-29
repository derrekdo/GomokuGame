extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var board = $board

func _input(event):
	if event is InputEventMouseButton:
		var mouse_pos = get_viewport().get_mouse_position()
		var tile_pos = board.map_to_world(board.world_to_map(mouse_pos))
		print(tile_pos)
