extends Node2D

@onready var collision_shape_2d: CollisionShape2D = $colision/CollisionShape2D
@onready var timer: Timer = $Timer
var tiempo_vivire 

var casilla_estoy : int

var mas_minutos_escena = preload("res://ecenas/minijuegos/mas_tiempo.tscn")

func _ready() -> void:
	timer.wait_time = tiempo_vivire
	timer.start()

func arriba():
	collision_shape_2d.call_deferred("set_disabled",false)

func abajo():
	collision_shape_2d.call_deferred("set_disabled",true)
	timer.start()

func _on_timer_timeout() -> void:
	get_tree().call_group("minijuego_conejo","liberar_casilla",casilla_estoy)
	queue_free()

func _on_colision_area_entered(_area: Area2D) -> void:
	var mas_m = mas_minutos_escena.instantiate()
	get_tree().call_group("minijuego_conejo","call_deferred","add_child",mas_m)
	mas_m.global_position = global_position
	get_tree().call_group("minijuego_conejo","liberar_casilla",casilla_estoy)
	get_tree().call_group("minijuego_conejo","more_minuts")
	queue_free()
