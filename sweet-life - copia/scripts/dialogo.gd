extends Control


@export_group("propiedades del sistema de dialogo")

@export var maximos_dialogos : int = 0
@export var numero_dialog : int = 0
@export var velocidad  = 0.1

var last_visible_chars := 0
var parsed_text := ""

@onready var sound: AudioStreamPlayer = $sound

@onready var texto_dialogo: RichTextLabel = $VBoxContainer/MarginContainer/RichTextLabel
var terminaron = false

func _process(_delta: float) -> void:
	# --- NUEVO BLOQUE DE AUDIO ---
	# refrescar el texto parseado en cada frame
	parsed_text = texto_dialogo.get_parsed_text()
	if parsed_text.is_empty():
		return

	var total_chars := parsed_text.length()
	var current_chars := int(floor(total_chars * texto_dialogo.visible_ratio + 0.0001))

	# Si hay un nuevo carácter mostrado
	if current_chars > last_visible_chars and current_chars > 0:
		sound.play()
		#print("sonar")
		pass

	last_visible_chars = current_chars

func set_text():
	if numero_dialog < Globals.dialogs.size():
		parsed_text = texto_dialogo.get_parsed_text()
		last_visible_chars = 0
		self.visible = true
		var tween = get_tree().create_tween()
		var duracion = velocidad * Globals.dialogs[numero_dialog].length()
		texto_dialogo.text = Globals.dialogs[numero_dialog]
		texto_dialogo.visible_ratio = 0.0
		tween.tween_property(texto_dialogo,"visible_ratio",1.00,velocidad * duracion)
		numero_dialog += 1
	else:
		self.visible = false
		numero_dialog = 0

func set_dialogo():
	if texto_dialogo.visible_ratio == 1:
		set_text()
	else:
		pass

func more_dialog():
	numero_dialog += 1
