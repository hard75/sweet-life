extends TextureRect

@onready var sombrero_seleccionado: Sprite2D = $SombreroSeleccionado

var en_centro : bool = false

func _ready() -> void:
	get_tree().call_group("sombreros grid","sombreros_buscar")

func soy_el_principal():
	if Globals.sombrero_texture == texture:
		sombrero_seleccionado.visible = true
	else:
		sombrero_seleccionado.visible = false

func seleccioname():
	en_centro = true
	get_tree().call_group("sombreros grid","sombreros_buscar")

func adios_centro():
	en_centro = false
	get_tree().call_group("sombreros grid","sombreros_buscar")

func _on_seleccionar_pressed() -> void:
	if en_centro:
		Globals.sombrero_texture = texture
		get_tree().call_group("player_mapa","set_sombrero")
		get_tree().call_group("sombreros grid","sombreros_buscar")
