extends CanvasLayer


@onready var pantalla : ColorRect = $ColorRect

func set_dormir():
	var tween : Tween = create_tween()
	tween.tween_property(pantalla,"color",Color(0.067, 0.0, 0.184, 0.824),0.5).set_trans(Tween.TRANS_SINE)
	get_tree().call_group("interfaz","interfaz_desaparecer_no_retorno")
	get_tree().call_group("player_mapa","dormir")
	


func set_up():
	var tween : Tween = create_tween()
	tween.tween_property(pantalla,"color",Color(0.619, 0.002, 0.806, 0.0),0.5).set_trans(Tween.TRANS_SINE)
	get_tree().call_group("interfaz","volver_interfaz_completa")
	get_tree().call_group("player_mapa","levantarse")
