extends TextureRect

var en_centro : bool = false

func seleccioname():
	en_centro = true
	get_tree().call_group("sombreros grid","sombreros_buscar")

func adios_centro():
	en_centro = false
	get_tree().call_group("sombreros grid","sombreros_buscar")


func _on_salir_2_pressed() -> void:
	if en_centro:
		Trancision.change_scene = $"../../..".salidas_de_sala
		Trancision.cerrar_logo_princ()
