extends Node2D

@export var sprite_texture_background : Array[CompressedTexture2D]
@export var tipo_de_sala : Array[int] # 1 es salir, 2 es hablar, 3 es dormir
@export var max_value_texture : int
var numero_fondo_estoy : int = 0
@export var personaje_saldra : Array[int]
@export var sprite_otro_personaje_sprite : Array[CompressedTexture2D]
var anterior_personaje_pantalla : int

@export var dialogo_npc_1 : Array[String]


@onready var npc: Sprite2D = $npc
@onready var background: Sprite2D = $Background

@export var salidas_de_salas_rutas : Array[String]

func _ready() -> void:
	Trancision.abrir()
	set_fondo()

func pasar_izquierda_fondo():
	anterior_personaje_pantalla = personaje_saldra[numero_fondo_estoy]
	numero_fondo_estoy -= 1
	if numero_fondo_estoy < 0:
		numero_fondo_estoy = max_value_texture
	set_fondo()

func set_fondo():
	Globals.dialogs = dialogo_npc_1
	background.texture = sprite_texture_background[numero_fondo_estoy]
	if sprite_otro_personaje_sprite[numero_fondo_estoy] != null:
		npc.texture = sprite_otro_personaje_sprite[numero_fondo_estoy]
	if tipo_de_sala[numero_fondo_estoy] == 1:
		get_tree().call_group("interfaz","salir")
	elif tipo_de_sala[numero_fondo_estoy] == 2:
		get_tree().call_group("interfaz","hablar")
	elif tipo_de_sala[numero_fondo_estoy] == 3:
		get_tree().call_group("interfaz","vestirse")
	elif tipo_de_sala[numero_fondo_estoy] == 4:
		get_tree().call_group("interfaz","dormir")
	
	if personaje_saldra[numero_fondo_estoy] != 0:
		change_npc()
	elif personaje_saldra[numero_fondo_estoy] == 0:
		if anterior_personaje_pantalla == 0:
			pass
		else:
			change_player()

func change_npc():
	get_tree().call_group("interfaz","interfaz_superior_desaparecer")
	var tween : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	tween.tween_property(npc,"position:y",0,0.7).set_trans(Tween.TRANS_SPRING )
	tween_2.tween_property($player,"position:y",128,0.7).set_trans(Tween.TRANS_SPRING )

func change_player():
	get_tree().call_group("interfaz","volver_interfaz_completa")
	var tween : Tween = create_tween()
	var tween_2 : Tween = create_tween()
	tween.tween_property(npc,"position:y",128,0.7).set_trans(Tween.TRANS_SPRING )
	tween_2.tween_property($player,"position:y",0,0.7).set_trans(Tween.TRANS_SPRING )

func pasar_derecha_fondo():
	anterior_personaje_pantalla = personaje_saldra[numero_fondo_estoy]
	numero_fondo_estoy += 1
	if numero_fondo_estoy > max_value_texture:
		numero_fondo_estoy = 0
	
	set_fondo()


func salir_de_sala():
	Trancision.change_scene = salidas_de_salas_rutas[numero_fondo_estoy]
	Trancision.cerrar_logo_princ()
	
