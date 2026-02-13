extends Node2D


var horas : int = 0
var minutos : int = 30
var conejos_ecena = preload("res://ecenas/minijuegos/conejo_minijuego.tscn")

@onready var tiempo: Label = $interfaz_minigame/tiempo
@onready var martillo: Node2D = $martillo
@onready var timer_2: Timer = $Timer2
@onready var timer_3: Timer = $Timer3
@onready var timer_4: Timer = $Timer4
@onready var timer_5: Timer = $Timer5
@onready var timer_6: Timer = $Timer6

func _ready() -> void:
	spawn_conejo()

func set_text_timer():
	tiempo.text = str(horas) + ":" + str(minutos)

func _on_timer_timeout() -> void:
	minutos -= 1
	search_time()

func search_time():
	if minutos < 0:
		minutos = 59
		horas -= 1
	if minutos >= 60:
		horas += 1
		minutos = 0
	set_text_timer()

func more_minuts():
	minutos += 1
	search_time()

func _on_martillo_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn".global_position
		martillo.martillo_golpear()

func _on_martillo_2_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn2".global_position
		martillo.martillo_golpear()

func _on_martillo_3_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn3".global_position
		martillo.martillo_golpear()

func _on_martillo_4_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn4".global_position
		martillo.martillo_golpear()

func _on_martillo_5_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn5".global_position
		martillo.martillo_golpear()

func _on_martillo_6_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn6".global_position
		martillo.martillo_golpear()

func _on_martillo_7_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn7".global_position
		martillo.martillo_golpear()

func _on_martillo_8_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn8".global_position
		martillo.martillo_golpear()

func _on_martillo_9_pressed() -> void:
	if martillo.martillando == false:
		martillo.global_position = $"posicion spawn9".global_position
		martillo.martillo_golpear()

var tiempo_de_vida_conejos = 5.1

var casilla_1 : bool = false
var casilla_2 : bool = false
var casilla_3 : bool = false
var casilla_4 : bool = false
var casilla_5 : bool = false
var casilla_6 : bool = false
var casilla_7 : bool = false
var casilla_8 : bool = false
var casilla_9 : bool = false

func liberar_casilla(numero_casilla : int):
	match numero_casilla:
		1:
			casilla_1 = false
		2:
			casilla_2 = false
		3:
			casilla_3 = false
		4:
			casilla_4 = false
		5:
			casilla_5 = false
		6:
			casilla_6 = false
		7:
			casilla_7 = false
		8:
			casilla_8 = false
		9:
			casilla_9 = false

func spawn_conejo() -> void:
	if tiempo_de_vida_conejos > 0.8:
		tiempo_de_vida_conejos -= 0.1
	var conejos_instancia = conejos_ecena.instantiate()
	call_deferred("add_child",conejos_instancia)
	conejos_instancia.tiempo_vivire = tiempo_de_vida_conejos
	var posiciones_conejos = randi_range(1,9)
	randomize()
	match posiciones_conejos:
		1:
			if casilla_1 == false:
				conejos_instancia.global_position = $"posicion spawn".global_position
				casilla_1 = true
				conejos_instancia.casilla_estoy = 1
			else:
				conejos_instancia.queue_free()
		2:
			if casilla_2 == false:
				conejos_instancia.global_position = $"posicion spawn2".global_position
				casilla_2 = true
				conejos_instancia.casilla_estoy = 2
			else:
				conejos_instancia.queue_free()
		3:
			if casilla_3 == false:
				conejos_instancia.global_position = $"posicion spawn3".global_position
				casilla_3 = true
				conejos_instancia.casilla_estoy = 3
			else:
				conejos_instancia.queue_free()
		4:
			if casilla_4 == false:
				conejos_instancia.global_position = $"posicion spawn4".global_position
				casilla_4 = true
				conejos_instancia.casilla_estoy = 4
			else:
				conejos_instancia.queue_free()
		5:
			if casilla_5 == false:
				conejos_instancia.global_position = $"posicion spawn5".global_position
				casilla_5 = true
				conejos_instancia.casilla_estoy = 5
			else:
				conejos_instancia.queue_free()
		6:
			if casilla_6 == false:
				conejos_instancia.global_position = $"posicion spawn6".global_position
				casilla_6 = true
				conejos_instancia.casilla_estoy = 6
			else:
				conejos_instancia.queue_free()
		7:
			if casilla_7 == false:
				conejos_instancia.global_position = $"posicion spawn7".global_position
				casilla_7 = true
				conejos_instancia.casilla_estoy = 7
			else:
				conejos_instancia.queue_free()
		8:
			if casilla_8 == false:
				conejos_instancia.global_position = $"posicion spawn8".global_position
				casilla_8 = true
				conejos_instancia.casilla_estoy = 8
			else:
				conejos_instancia.queue_free()
		9:
			if casilla_9 == false:
				conejos_instancia.global_position = $"posicion spawn9".global_position
				casilla_9 = true
				conejos_instancia.casilla_estoy = 9
			else:
				conejos_instancia.queue_free()
	if timer_2.wait_time > 0.8:
		timer_2.wait_time -= 0.2
	elif timer_2.wait_time < 0.1:
		timer_2.wait_time = 1
	timer_2.start()

func spawn_conejos_2():
	if tiempo_de_vida_conejos > 0.8:
		tiempo_de_vida_conejos -= 0.1
	var conejos_instancia = conejos_ecena.instantiate()
	call_deferred("add_child",conejos_instancia)
	conejos_instancia.tiempo_vivire = tiempo_de_vida_conejos
	var posiciones_conejos = randi_range(1,9)
	randomize()
	match posiciones_conejos:
		1:
			if casilla_1 == false:
				conejos_instancia.global_position = $"posicion spawn".global_position
				casilla_1 = true
				conejos_instancia.casilla_estoy = 1
			else:
				conejos_instancia.queue_free()
		2:
			if casilla_2 == false:
				conejos_instancia.global_position = $"posicion spawn2".global_position
				casilla_2 = true
				conejos_instancia.casilla_estoy = 2
			else:
				conejos_instancia.queue_free()
		3:
			if casilla_3 == false:
				conejos_instancia.global_position = $"posicion spawn3".global_position
				casilla_3 = true
				conejos_instancia.casilla_estoy = 3
			else:
				conejos_instancia.queue_free()
		4:
			if casilla_4 == false:
				conejos_instancia.global_position = $"posicion spawn4".global_position
				casilla_4 = true
				conejos_instancia.casilla_estoy = 4
			else:
				conejos_instancia.queue_free()
		5:
			if casilla_5 == false:
				conejos_instancia.global_position = $"posicion spawn5".global_position
				casilla_5 = true
				conejos_instancia.casilla_estoy = 5
			else:
				conejos_instancia.queue_free()
		6:
			if casilla_6 == false:
				conejos_instancia.global_position = $"posicion spawn6".global_position
				casilla_6 = true
				conejos_instancia.casilla_estoy = 6
			else:
				conejos_instancia.queue_free()
		7:
			if casilla_7 == false:
				conejos_instancia.global_position = $"posicion spawn7".global_position
				casilla_7 = true
				conejos_instancia.casilla_estoy = 7
			else:
				conejos_instancia.queue_free()
		8:
			if casilla_8 == false:
				conejos_instancia.global_position = $"posicion spawn8".global_position
				casilla_8 = true
				conejos_instancia.casilla_estoy = 8
			else:
				conejos_instancia.queue_free()
		9:
			if casilla_9 == false:
				conejos_instancia.global_position = $"posicion spawn9".global_position
				casilla_9 = true
				conejos_instancia.casilla_estoy = 9
			else:
				conejos_instancia.queue_free()
	if timer_3.wait_time > 0.8:
		timer_3.wait_time -= 0.2
	elif timer_3.wait_time < 0.1:
		timer_3.wait_time = 1
	timer_3.start()

func spawn_conejo_3():
	if tiempo_de_vida_conejos > 0.8:
		tiempo_de_vida_conejos -= 0.1
	var conejos_instancia = conejos_ecena.instantiate()
	call_deferred("add_child",conejos_instancia)
	conejos_instancia.tiempo_vivire = tiempo_de_vida_conejos
	var posiciones_conejos = randi_range(1,9)
	randomize()
	match posiciones_conejos:
		1:
			if casilla_1 == false:
				conejos_instancia.global_position = $"posicion spawn".global_position
				casilla_1 = true
				conejos_instancia.casilla_estoy = 1
			else:
				conejos_instancia.queue_free()
		2:
			if casilla_2 == false:
				conejos_instancia.global_position = $"posicion spawn2".global_position
				casilla_2 = true
				conejos_instancia.casilla_estoy = 2
			else:
				conejos_instancia.queue_free()
		3:
			if casilla_3 == false:
				conejos_instancia.global_position = $"posicion spawn3".global_position
				casilla_3 = true
				conejos_instancia.casilla_estoy = 3
			else:
				conejos_instancia.queue_free()
		4:
			if casilla_4 == false:
				conejos_instancia.global_position = $"posicion spawn4".global_position
				casilla_4 = true
				conejos_instancia.casilla_estoy = 4
			else:
				conejos_instancia.queue_free()
		5:
			if casilla_5 == false:
				conejos_instancia.global_position = $"posicion spawn5".global_position
				casilla_5 = true
				conejos_instancia.casilla_estoy = 5
			else:
				conejos_instancia.queue_free()
		6:
			if casilla_6 == false:
				conejos_instancia.global_position = $"posicion spawn6".global_position
				casilla_6 = true
				conejos_instancia.casilla_estoy = 6
			else:
				conejos_instancia.queue_free()
		7:
			if casilla_7 == false:
				conejos_instancia.global_position = $"posicion spawn7".global_position
				casilla_7 = true
				conejos_instancia.casilla_estoy = 7
			else:
				conejos_instancia.queue_free()
		8:
			if casilla_8 == false:
				conejos_instancia.global_position = $"posicion spawn8".global_position
				casilla_8 = true
				conejos_instancia.casilla_estoy = 8
			else:
				conejos_instancia.queue_free()
		9:
			if casilla_9 == false:
				conejos_instancia.global_position = $"posicion spawn9".global_position
				casilla_9 = true
				conejos_instancia.casilla_estoy = 9
			else:
				conejos_instancia.queue_free()
	if timer_4.wait_time > 0.8:
		timer_4.wait_time -= 0.2
	elif timer_4.wait_time < 0.1:
		timer_4.wait_time = 1
	timer_4.start()

func spawn_conejo_4():
	if tiempo_de_vida_conejos > 0.8:
		tiempo_de_vida_conejos -= 0.1
	var conejos_instancia = conejos_ecena.instantiate()
	call_deferred("add_child",conejos_instancia)
	conejos_instancia.tiempo_vivire = tiempo_de_vida_conejos
	var posiciones_conejos = randi_range(1,9)
	randomize()
	match posiciones_conejos:
		1:
			if casilla_1 == false:
				conejos_instancia.global_position = $"posicion spawn".global_position
				casilla_1 = true
				conejos_instancia.casilla_estoy = 1
			else:
				conejos_instancia.queue_free()
		2:
			if casilla_2 == false:
				conejos_instancia.global_position = $"posicion spawn2".global_position
				casilla_2 = true
				conejos_instancia.casilla_estoy = 2
			else:
				conejos_instancia.queue_free()
		3:
			if casilla_3 == false:
				conejos_instancia.global_position = $"posicion spawn3".global_position
				casilla_3 = true
				conejos_instancia.casilla_estoy = 3
			else:
				conejos_instancia.queue_free()
		4:
			if casilla_4 == false:
				conejos_instancia.global_position = $"posicion spawn4".global_position
				casilla_4 = true
				conejos_instancia.casilla_estoy = 4
			else:
				conejos_instancia.queue_free()
		5:
			if casilla_5 == false:
				conejos_instancia.global_position = $"posicion spawn5".global_position
				casilla_5 = true
				conejos_instancia.casilla_estoy = 5
			else:
				conejos_instancia.queue_free()
		6:
			if casilla_6 == false:
				conejos_instancia.global_position = $"posicion spawn6".global_position
				casilla_6 = true
				conejos_instancia.casilla_estoy = 6
			else:
				conejos_instancia.queue_free()
		7:
			if casilla_7 == false:
				conejos_instancia.global_position = $"posicion spawn7".global_position
				casilla_7 = true
				conejos_instancia.casilla_estoy = 7
			else:
				conejos_instancia.queue_free()
		8:
			if casilla_8 == false:
				conejos_instancia.global_position = $"posicion spawn8".global_position
				casilla_8 = true
				conejos_instancia.casilla_estoy = 8
			else:
				conejos_instancia.queue_free()
		9:
			if casilla_9 == false:
				conejos_instancia.global_position = $"posicion spawn9".global_position
				casilla_9 = true
				conejos_instancia.casilla_estoy = 9
			else:
				conejos_instancia.queue_free()
	if timer_5.wait_time > 0.8:
		timer_5.wait_time -= 0.2
	elif timer_5.wait_time < 0.1:
		timer_5.wait_time = 1
	timer_5.start()

func spawn_conejo_5():
	if tiempo_de_vida_conejos > 0.8:
		tiempo_de_vida_conejos -= 0.1
	var conejos_instancia = conejos_ecena.instantiate()
	call_deferred("add_child",conejos_instancia)
	conejos_instancia.tiempo_vivire = tiempo_de_vida_conejos
	var posiciones_conejos = randi_range(1,9)
	randomize()
	match posiciones_conejos:
		1:
			if casilla_1 == false:
				conejos_instancia.global_position = $"posicion spawn".global_position
				casilla_1 = true
				conejos_instancia.casilla_estoy = 1
			else:
				conejos_instancia.queue_free()
		2:
			if casilla_2 == false:
				conejos_instancia.global_position = $"posicion spawn2".global_position
				casilla_2 = true
				conejos_instancia.casilla_estoy = 2
			else:
				conejos_instancia.queue_free()
		3:
			if casilla_3 == false:
				conejos_instancia.global_position = $"posicion spawn3".global_position
				casilla_3 = true
				conejos_instancia.casilla_estoy = 3
			else:
				conejos_instancia.queue_free()
		4:
			if casilla_4 == false:
				conejos_instancia.global_position = $"posicion spawn4".global_position
				casilla_4 = true
				conejos_instancia.casilla_estoy = 4
			else:
				conejos_instancia.queue_free()
		5:
			if casilla_5 == false:
				conejos_instancia.global_position = $"posicion spawn5".global_position
				casilla_5 = true
				conejos_instancia.casilla_estoy = 5
			else:
				conejos_instancia.queue_free()
		6:
			if casilla_6 == false:
				conejos_instancia.global_position = $"posicion spawn6".global_position
				casilla_6 = true
				conejos_instancia.casilla_estoy = 6
			else:
				conejos_instancia.queue_free()
		7:
			if casilla_7 == false:
				conejos_instancia.global_position = $"posicion spawn7".global_position
				casilla_7 = true
				conejos_instancia.casilla_estoy = 7
			else:
				conejos_instancia.queue_free()
		8:
			if casilla_8 == false:
				conejos_instancia.global_position = $"posicion spawn8".global_position
				casilla_8 = true
				conejos_instancia.casilla_estoy = 8
			else:
				conejos_instancia.queue_free()
		9:
			if casilla_9 == false:
				conejos_instancia.global_position = $"posicion spawn9".global_position
				casilla_9 = true
				conejos_instancia.casilla_estoy = 9
			else:
				conejos_instancia.queue_free()
	if timer_6.wait_time > 0.8:
		timer_6.wait_time -= 0.2
	elif timer_6.wait_time < 0.1:
		timer_6.wait_time = 1
	timer_6.start()

func _on_timer_2_timeout() -> void:
	spawn_conejo()

func _on_timer_3_timeout() -> void:
	spawn_conejos_2()

func _on_timer_4_timeout() -> void:
	spawn_conejo_3()

func _on_timer_5_timeout() -> void:
	spawn_conejo_4()

func _on_timer_6_timeout() -> void:
	spawn_conejo_5()
