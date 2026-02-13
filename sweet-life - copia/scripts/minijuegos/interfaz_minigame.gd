extends CanvasLayer



@onready var pausa_sonido: AudioStreamPlayer = $"pausa sonido"
@onready var pausa: TouchScreenButton = $pausa
@onready var continuar: TouchScreenButton = $continuar
@onready var fondo_pausa: Node2D = $fondo_pausa



func _on_pausa_released() -> void:
	fondo_pausa.visible = true
	get_tree().paused = true
	pausa_sonido.play()
	pausa.position = Vector2(96,128)
	continuar.position = Vector2(96,109)


func _on_continuar_released() -> void:
	fondo_pausa.visible = false
	get_tree().paused = false
	pausa_sonido.play()
	continuar.position = Vector2(96,128)
	pausa.position = Vector2(96,109)
