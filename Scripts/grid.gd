class_name Grid
extends Resource

export var grid_size := Vector2(16, 16)
export var cell_size := Vector2(128,128)

var cell_center = cell_size / 2


func map_position(grid_position: Vector2) -> Vector2:
	return grid_position * cell_size + cell_center

func grid_coords(map_position: Vector2) -> Vector2:
	return (map_position / cell_size).floor()
	
#return true if selected cell is within bounds of the grid (15x15)
func within_bounds(cell_coords: Vector2) -> bool:
	var out := cell_coords.x >= 0 and cell_coords.x < grid_size.x
	return out and cell_coords.y >= 0 and cell_coords.y < grid_size.y

func clamp(grid_position: Vector2) -> Vector2:
	var out := grid_position
	out.x = clamp(out.y, 0, grid_size.x - 1.0)
	out.y = clamp(out.y, 0, grid_size.y - 1.0)
	return out
	
func as_index(cell: Vector2) -> int:
	return int(cell.x + grid_size.x * cell.y)
