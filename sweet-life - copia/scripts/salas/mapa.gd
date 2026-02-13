extends Node2D


@onready var camera  = $mapa

func _ready() -> void:
	Trancision.abrir()

func _on_flecha_pressed() -> void:
	if camera.position.y == 128:
		pass
	else:
		camara_arr()

func _on_flecha_2_pressed() -> void:
	if camera.position.y == -128:
		pass
	else:
		camara_ab()

func _on_flecha_3_pressed() -> void:
	if camera.position.x == -128:
		pass
	else:
		camara_der()

func _on_flecha_4_pressed() -> void:
	if camera.position.x == 128:
		pass
	else:
		camara_izq()

func camara_izq():
	disabled_controls()
	var tween = create_tween()
	var nueva_pos = camera.position.x + 128
	var camara_pos = camera.position.y #esto es no mas para la posicion y solo ignoralo
	tween.tween_property(camera,"position",Vector2(nueva_pos,camara_pos),0.8).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(enabled_controls)
	$flechas.play()

func camara_der():
	disabled_controls()
	var tween = create_tween()
	var nueva_pos = camera.position.x - 128
	var camara_pos = camera.position.y #esto es no mas para la posicion y solo ignoralo
	tween.tween_property(camera,"position",Vector2(nueva_pos,camara_pos),0.8).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(enabled_controls)
	$flechas.play()

func camara_arr():
	disabled_controls()
	var tween = create_tween()
	var nueva_pos = camera.position.y + 128
	var camara_pos = camera.position.x #esto es no mas para la posicion x solo ignoralo
	tween.tween_property(camera,"position",Vector2(camara_pos,nueva_pos),0.8).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(enabled_controls)
	$flechas.play()

func camara_ab():
	disabled_controls()
	var tween = create_tween()
	var nueva_pos = camera.position.y - 128
	var camara_pos = camera.position.x #esto es no mas para la posicion x solo ignoralo
	tween.tween_property(camera,"position",Vector2(camara_pos,nueva_pos),0.8).set_trans(Tween.TRANS_SINE)
	tween.tween_callback(enabled_controls)
	$flechas.play()

func enabled_controls():
	if camera.position.y == 128:
		pass
	else:
		$"flechas mapa/flecha".visible = true
	if camera.position.y == -128:
		pass
	else:
		$"flechas mapa/flecha2".visible = true
	if camera.position.x == -128:
		pass
	else:
		$"flechas mapa/flecha3".visible = true
	if camera.position.x == 128:
		pass
	else:
		$"flechas mapa/flecha4".visible = true

func disabled_controls():
	$"flechas mapa/flecha".visible = false
	$"flechas mapa/flecha2".visible = false
	$"flechas mapa/flecha3".visible = false
	$"flechas mapa/flecha4".visible = false
