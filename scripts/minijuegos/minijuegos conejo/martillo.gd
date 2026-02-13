extends Node2D


var martillando : bool = false

func martillo_golpear():
	martillando = true
	$AnimationPlayer.play("golpear")

func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	get_tree().call_group("minijuego_conejo","martillo_fuera_posicion")
	global_position = Vector2(200,200)
	martillando = false
