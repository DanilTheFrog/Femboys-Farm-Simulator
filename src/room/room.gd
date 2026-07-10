extends Node
class_name Room

var layout: Resource
var room_name: String

var tiles: Array[Array] = []
var item_objects: Array[ItemObject] = []
var entities

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	build_room()
	place_item_objects()
	place_entites()
	pass # Replace with function body.

func place_entites() -> void:
	pass
	
func build_room() -> void:
	pass

func place_item_objects() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func serialize() -> String:
	pass
	return ""
	
func deserialize() -> Room:
	pass
	return Room.new();
