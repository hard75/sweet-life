extends CanvasLayer

var logo_aparece = 0
var change_scene : String

func cerrar_logo_princ():#cuando se cierra con el logo principal
	$fondo.play("cerrando")
	logo_aparece = 1

func _on_fondo_animation_finished(anim_name: StringName) -> void:
	if anim_name == "cerrando":
		get_tree().change_scene_to_file("res://ecenas/cargando_ecene.tscn")
		$pelotitas.play("moviendose")
		if logo_aparece == 1:
			$iconos.play("sweet_life_logo_apar")


func _on_iconos_animation_finished(anim_name: StringName) -> void:
	if anim_name == "sweet_life_logo_apar":
		$iconos.play("sweet_life_logo_stay")

func abrir():
	$fondo.play("abriendo")
	$iconos.play("desp")
	$pelotitas.stop()
