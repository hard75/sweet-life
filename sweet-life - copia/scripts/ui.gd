extends CanvasLayer

@export var comida_ecena : PackedScene

@export var ecena_saldre : String



func _process(_delta: float) -> void:
	$Control/hambre/comida.value = Globals.hambre
	$Control/hambre/sed.value = Globals.sed
	$Control/hambre/energia.value = Globals.energia
	$Control/hambre/salud.value = Globals.salud

func _on_izquierda_pressed() -> void:
	$flechas.play()
	get_tree().call_group("level","pasar_izquierda_fondo")

func _on_derecha_pressed() -> void:
	$flechas.play()
	get_tree().call_group("level","pasar_derecha_fondo")

func _on_comida_pressed() -> void:
	$agarrar.play()

func _on_bebida_pressed() -> void:
	$agarrar.play()

func _on_salir_pressed() -> void:
	get_tree().call_group("level","salir_de_sala")

func salir():
	$Control/salir.position = Vector2(72,103)
	$Control/hablar.position = Vector2(72,135)
	$Control/vestirse.position = Vector2(72,135)
	$Control/dormir.position = Vector2(72,135)

func hablar():
	$Control/salir.position = Vector2(72,135)
	$Control/hablar.position = Vector2(72,103)
	$Control/vestirse.position = Vector2(72,135)
	$Control/dormir.position = Vector2(72,135)

func vestirse():
	$Control/salir.position = Vector2(72,135)
	$Control/hablar.position = Vector2(72,135)
	$Control/vestirse.position = Vector2(72,103)
	$Control/dormir.position = Vector2(72,135)

func dormir():
	$Control/salir.position = Vector2(72,135)
	$Control/hablar.position = Vector2(72,135)
	$Control/vestirse.position = Vector2(72,135)
	$Control/dormir.position = Vector2(72,103)

func interfaz_desaparecer_no_retorno():
	var tween_1 : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	var tween_3 : Tween = create_tween()
	tween_1.tween_property($Control/izquierda,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_2.tween_property($Control/derecha,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_3.tween_property($Control/hambre,"position:y",-88,0.25).set_trans(Tween.TRANS_SINE)
	$Control/comida.position = Vector2(33,130)
	$Control/bebida.position = Vector2(126,130)
	$Control/Comidas.position = Vector2(17,145)
	$Control/bebidas.position= Vector2(110,145)

func interfaz_superior_desaparecer():
	var tween_1 : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	var tween_3 : Tween = create_tween()
	tween_1.tween_property($Control/izquierda,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_2.tween_property($Control/derecha,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_3.tween_property($Control/hambre,"position:y",-88,0.25).set_trans(Tween.TRANS_SINE)
	$Control/comida.position = Vector2(33,130)
	$Control/bebida.position = Vector2(126,130)
	$Control/Comidas.position = Vector2(17,145)
	$Control/bebidas.position= Vector2(110,145)
	tween_1.tween_callback(interfaz_flechas_volvio)

func interfaz_flechas_volvio():
	var tween_1 : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	tween_1.tween_property($Control/izquierda,"position:y",0,0.25).set_trans(Tween.TRANS_SINE)
	tween_2.tween_property($Control/derecha,"position:y",0,0.25).set_trans(Tween.TRANS_SINE)

func volver_interfaz_completa():
	var tween_1 : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	var tween_3 : Tween = create_tween()
	tween_1.tween_property($Control/izquierda,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_1.tween_property($Control/izquierda,"position:y",0,0.25).set_trans(Tween.TRANS_SINE)
	
	tween_2.tween_property($Control/derecha,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_2.tween_property($Control/derecha,"position:y",0,0.25).set_trans(Tween.TRANS_SINE)
	
	tween_3.tween_property($Control/hambre,"position:y",-27,0.25).set_trans(Tween.TRANS_SINE)
	tween_3.tween_property($Control/hambre,"position:y",0,0.25).set_trans(Tween.TRANS_SINE)
	
	$Control/comida.position = Vector2(33,95)
	$Control/bebida.position = Vector2(126,95)
	$Control/Comidas.position = Vector2(17,110)
	$Control/bebidas.position= Vector2(110,110)


func _on_hablar_pressed() -> void:
	get_tree().call_group("cuadro_dialogo","set_dialogo")

var dormido : bool = false

func _on_dormir_pressed() -> void:
	if !dormido:
		get_tree().call_group("dormir","set_dormir")
		dormido = true
	elif dormido:
		get_tree().call_group("dormir","set_up")
		dormido = false


func _on_vestirse_pressed() -> void:
	get_tree().call_group("level","salir_de_sala")
