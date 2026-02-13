extends Node2D

@onready var progress : Array
@onready var scene_load_status : int

func _ready() -> void:
	ResourceLoader.load_threaded_request(Trancision.change_scene)

func _process(_delta: float) -> void:
	scene_load_status = ResourceLoader.load_threaded_get_status(Trancision.change_scene,progress)
	
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		$Timer.start()
		set_process(false)


func _on_timer_timeout() -> void:
	get_tree().call_deferred("change_scene_to_packed",ResourceLoader.load_threaded_get(Trancision.change_scene))
