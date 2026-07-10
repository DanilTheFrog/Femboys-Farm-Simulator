extends Control

signal on_action_pressed(id: int);

signal on_item_select(id: int);

@export var layer1: TileMapLayer;
@export var layer2: TileMapLayer;


func set_actions():
	pass
	
func set_items():
	pass

func _create_item():
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		var pos: Vector2 = layer1.get_local_mouse_position()
		#pos = layer1.to_local(pos)
		var tile = layer1.local_to_map(pos);
		layer1.set_cell(tile, 1, Vector2i(1, 0))
		print(tile);
		
