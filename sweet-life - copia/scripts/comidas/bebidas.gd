extends CharacterBody2D

var start_position: Vector2
var dragging: bool = false
var soy = 2

func _ready():
	start_position = global_position

func _input(event: InputEvent) -> void:
	# --- Detectar inicio o fin del arrastre ---
	if event is InputEventScreenTouch or event is InputEventMouseButton:
		if event.pressed:
			if _is_over(event.position):
				dragging = true
				velocity = Vector2.ZERO # Detiene cualquier movimiento físico
		else:
			if dragging:
				dragging = false
				global_position = start_position
				velocity = Vector2.ZERO
				get_tree().call_group("player_mapa","beber")

	# --- Mientras se arrastra ---
	elif event is InputEventScreenDrag or event is InputEventMouseMotion:
		if dragging:
			global_position = event.position

# --- Detectar si el clic o toque fue sobre el sprite ---
func _is_over(point: Vector2) -> bool:
	var sprite: Sprite2D = $bebida0001
	if sprite == null:
		return false

	var tex: Texture2D = sprite.texture
	if tex == null:
		return false

	var local_point: Vector2 = sprite.to_local(point)
	var rect: Rect2 = Rect2(
		-tex.get_size() * sprite.scale / 2.0,
		tex.get_size() * sprite.scale
	)

	return rect.has_point(local_point)
