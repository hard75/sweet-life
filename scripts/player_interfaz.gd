extends Node2D


var va_a_comer : bool = false

var tipo_comida : int

@onready var sombrero: Sprite2D = $Sombrero


func _ready() -> void:
	set_sombrero()

func _on_comida_area_entered(_area: Area2D) -> void:
	$AnimationPlayer.play("empezar a comer")
	$"pestañar".stop()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "empezar a comer":
		$AnimationPlayer.play("comer")
	if anim_name == "pestañear":
		$AnimationPlayer.play("idle")
		$"pestañar".start()

func _on_comida_area_exited(_area: Area2D) -> void:
	$AnimationPlayer.play("pestañear")

func _on_pestañar_timeout() -> void:
	$AnimationPlayer.play("pestañear")


func _on_comida_body_entered(body: Node2D) -> void:
	if body.soy == 1:
		tipo_comida = 1
	elif body.soy == 2:
		tipo_comida = 2
	if tipo_comida == 1:
		if Globals.hambre < 100:
			$AnimationPlayer.play("empezar a comer")
		else:
			$AnimationPlayer.play("no_gracias")
	elif tipo_comida == 2:
		if Globals.sed < 100:
			$AnimationPlayer.play("empezar a comer")
		else:
			$AnimationPlayer.play("no_gracias")
	$"pestañar".stop()
	va_a_comer = true


func _on_comida_body_exited(_body: Node2D) -> void:
	$AnimationPlayer.play("pestañear")
	va_a_comer = false

func alimentarme():
	if va_a_comer:
		if Globals.hambre < 100:
			Globals.hambre += Globals.comida_sacia_cant
			va_a_comer = false
			print(str(Globals.hambre))
			comer_efecto()
			$comer.play()

func beber():
	if va_a_comer:
		if Globals.sed < 100:
			Globals.sed += Globals.bebida_sacia_cant
			va_a_comer = false
			print(str(Globals.sed))
			comer_efecto()
			$beber.play()

func dormir():
	$AnimationPlayer.play("dormir")
	$"pestañar".stop()
	$z.emitting = true

func levantarse():
	$AnimationPlayer.play("pestañear")
	$"pestañar".start()
	$z.emitting = false

func comer_efecto():
	var tween : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	tween.tween_property($PlayerInterfaz_png/efecto,"color",Color(1.0, 1.0, 1.0, 1.0),0.3).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($PlayerInterfaz_png/efecto,"color",Color(1.0, 1.0, 1.0, 0.0),0.25).set_trans(Tween.TRANS_CUBIC)
	tween_2.tween_property($Sombrero/efecto,"color",Color(1.0, 1.0, 1.0, 1.0),0.3).set_trans(Tween.TRANS_CUBIC)
	tween_2.tween_property($Sombrero/efecto,"color",Color(1.0, 1.0, 1.0, 0.0),0.25).set_trans(Tween.TRANS_CUBIC)

func set_sombrero():
	sombrero.texture = Globals.sombrero_texture
