extends Control

@onready var shader_mat: ShaderMaterial = $fondo_2.material

func _ready():
	_update_screen_size()
	get_viewport().connect("size_changed", Callable(self, "_update_screen_size"))

func _update_screen_size():
	shader_mat.set_shader_parameter("screen_size", get_viewport_rect().size)
