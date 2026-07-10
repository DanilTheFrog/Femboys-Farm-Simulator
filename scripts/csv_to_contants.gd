extends Node

@export var csv_path: Resource
@export var constants_path: Resource
var DELIMETER: String = ","
@export var marker: String = "ITEMS"

func _ready() -> void:
	pass # Replace with function body.


func run() -> void:
	var variables: Array[String] = parse();
	var constants = FileAccess.open(constants_path.resource_path, FileAccess.ModeFlags.READ_WRITE);
	
	pass
	
func parse() -> Array[String]:
	var arr: Array[String];
	var csv = FileAccess.open(csv_path.resource_path, FileAccess.ModeFlags.READ);
	
	csv.get_line()
	var regex: RegEx = RegEx.new();
	regex.compile("[a-zA-Z]")
	
	var line: String = ""
	while not csv.eof_reached():
		line = csv.get_line()
		var first: String = line.split(DELIMETER)[0];
		var result: String = ""
		for i in range(0, len(first)):
			var letter = first[i];
			if regex.search(letter):
				result += letter
			else:
				result += "_"
		result = result.to_upper();
		result = "var " + result + " = " + first;
		arr.append(result)
	
	return arr;
				
		

	
