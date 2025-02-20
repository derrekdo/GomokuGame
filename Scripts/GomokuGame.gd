extends Node2D



onready var _white_piece: Resource = preload("res://Scenes/WhitePiece.tscn")
onready var _black_piece: Resource = preload("res://Scenes/BlackPiece.tscn")
# Called when the node enters the scene tree for the first time.
onready var _white_spawn: Node2D = $whitespawn
onready var _black_spawn: Node2D = $blackspawn

enum _turn {WHITE, BLACK}
var _curr_turn
var _white_cells := []
var _black_cells := []
var _all_cells := []

func _ready():
	if (randi()%2 == 0):
		_curr_turn = _turn.WHITE
	else: _curr_turn = _turn.BLACK
	pass # Replace with function body.


func _on_Gameboard_click(cell, tile_pos, center):
	
	pass
#	print(cell)

func _place_piece(tile_pos, center):
	if (_curr_turn == _turn.WHITE):
		var piece = _white_piece.instance()
		piece.global_position = tile_pos + center
		_white_spawn.add_child(piece)
		_curr_turn = _turn.BLACK
	else:
		var piece = _black_piece.instance()
		piece.global_position = tile_pos + center
		_black_spawn.add_child(piece)
		_curr_turn = _turn.WHITE	
