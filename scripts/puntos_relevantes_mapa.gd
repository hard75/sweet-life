extends Node2D


@export var casa_habiable : bool = true



func _on_casa_normal_pressed() -> void:
	if casa_habiable:
		Trancision.change_scene = "res://ecenas/habitaciones/sala_1.tscn"
		Trancision.cerrar_logo_princ()
