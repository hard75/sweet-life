extends Node2D


var izquierda_habilitado : bool
var derecha_habilitado : bool

var index_sombrero : int = 0

@export var salidas_de_sala : String

@export var sombreros_texturas : Array[CompressedTexture2D]
var sombrero_ecena = preload("res://ecenas/sombrero.tscn")


func _ready() -> void:
	Trancision.abrir()
	spawn_sombreros()

func _on_izquierda_coll_area_entered(_area: Area2D) -> void:
	izquierda_habilitado = true

func _on_izquierda_coll_area_exited(_area: Area2D) -> void:
	izquierda_habilitado = false

func _on_derecha_coll_area_entered(_area: Area2D) -> void:
	derecha_habilitado = true

func _on_derecha_coll_area_exited(_area: Area2D) -> void:
	derecha_habilitado = false


func spawn_sombreros():
	for items in Globals.sombreros_guardados.size():
		spawn_sombreros_ecena(index_sombrero)
		index_sombrero += 1


func spawn_sombreros_ecena(index : int):
	var new_hat = sombrero_ecena.instantiate()
	new_hat.texture = sombreros_texturas[index]
	$"sombreros/sombreros contenedor".add_child(new_hat)


func _on_flecha_3_pressed() -> void:
	if derecha_habilitado:
		$izquierda_coll/CollisionShape2D.call_deferred("set_disabled",true)
		$derecha_coll/CollisionShape2D.call_deferred("set_disabled",true)
		var tween = create_tween()
		$flecha3.visible = false
		$flecha4.visible = false
		var posicion_nueva = ($"sombreros/sombreros contenedor".position.x - 42)
		tween.tween_property($"sombreros/sombreros contenedor","position:x",posicion_nueva,0.2).set_trans(Tween.TRANS_SINE)
		tween.tween_callback(enabled_control)

func enabled_control():
	$izquierda_coll/CollisionShape2D.call_deferred("set_disabled",false)
	$derecha_coll/CollisionShape2D.call_deferred("set_disabled",false)
	$flecha3.visible = true
	$flecha4.visible = true
	


func _on_flecha_4_pressed() -> void:
	if izquierda_habilitado:
		$izquierda_coll/CollisionShape2D.call_deferred("set_disabled",true)
		$derecha_coll/CollisionShape2D.call_deferred("set_disabled",true)
		var tween = create_tween()
		$flecha3.visible = false
		$flecha4.visible = false
		var posicion_nueva = ($"sombreros/sombreros contenedor".position.x + 42)
		tween.tween_property($"sombreros/sombreros contenedor","position:x",posicion_nueva,0.2).set_trans(Tween.TRANS_SINE)
		tween.tween_callback(enabled_control)


func _on_sombrero_seleccionado_area_entered(area: Area2D) -> void:
	var area_padre = area.get_parent()
	if area_padre.has_method("seleccioname"):
		area_padre.seleccioname()



func _on_sombrero_seleccionado_area_exited(area: Area2D) -> void:
	var area_padre = area.get_parent()
	if area_padre.has_method("adios_centro"):
		area_padre.adios_centro()


func sombreros_buscar():
	var sombreros_nodos = $"sombreros/sombreros contenedor".get_children()
	for n in sombreros_nodos:
		if n.has_method("soy_el_principal"):
			n.soy_el_principal()
