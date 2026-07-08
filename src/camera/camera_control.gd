extends Camera2D

@export var SPEED: float = 300;
@export var ZOOM_MAX: Vector2 = Vector2(5., 5.);
@export var ZOOM_MIN: Vector2 = Vector2(0.5, 0.5);

var ZOOM_STEP: Vector2 = Vector2(0.1, 0.1);


func _ready() -> void:
	#_set_camera_limit();
	pass;


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		match event.button_index:
			4:
				zoom +=  ZOOM_STEP;
			5:
				zoom += -ZOOM_STEP;
		zoom = clamp(zoom, ZOOM_MIN, ZOOM_MAX);


func _process(delta: float) -> void:
	var dir = Input.get_vector("left", "right", "up", "down");
	var vec = dir * SPEED * delta;
	self.position += vec;


func _set_camera_limit() -> void:
	limit_top = 0;
	limit_bottom = Constants.MAX_TILES_Y * Constants.TEXTURE_RESOLUTION;
	limit_left = 0;
	limit_left = Constants.MAX_TILES_X * Constants.TEXTURE_RESOLUTION;
