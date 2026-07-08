extends ColorRect
# !TODO Переделать на shader

@export() var grid_color: Color = Color.RED;
@export() var grid_width: float = 1.1;

var tile_size: int = Constants.TEXTURE_RESOLUTION;
var max_tiles: Vector2 = Vector2(Constants.MAX_TILES_X, Constants.MAX_TILES_Y);

var debug_key: int = KEY_X
var is_grid_visible: bool = false;

func _ready() -> void:
	custom_minimum_size = Vector2(tile_size*max_tiles.x, tile_size*max_tiles.y);

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == debug_key:
			is_grid_visible = !is_grid_visible;
			queue_redraw()

func _draw() -> void:
	match is_grid_visible:
		true:
			draw_grid();
			

func draw_grid() -> void:
	
	# x lines from top to bottom
	for x in max_tiles.x:
		draw_line(
			Vector2(x*tile_size, 0),
			Vector2(x*tile_size, max_tiles.y*tile_size),
			grid_color, grid_width);
		
	# y lines from left to right
	for y in max_tiles.y:
		draw_line(
			Vector2(0, y*tile_size),
			Vector2(max_tiles.x*tile_size, y*tile_size),
			grid_color, grid_width);
