extends Node2D

var background_estoy : int = 1

func _ready() -> void:
	Trancision.abrir()



func _on_salir_pressed() -> void:
	Trancision.change_scene = "res://ecenas/habitaciones/sala_1.tscn"
	Trancision.cerrar_logo_princ()
