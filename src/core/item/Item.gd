extends RefCounted
class_name Item

var item_id: String = ""

var item_description: String

var item_image: Image
var item_data: ItemData

func item_name() -> String:
	return tr(item_id);

func serialize():
	pass
	
