extends Control

@onready var label: Label = $Label
@onready var timer: Timer = $Timer

var dot_count: int = 0
var preloaded_scene: Node 

func _ready() -> void:
	timer.start(0.4)
	timer.timeout.connect(_on_dot_count_timer)
	
	var scene_resource = load(Global.TARGET_PATH)
	preloaded_scene = scene_resource.instantiate()
	
	await get_tree().create_timer(3.0).timeout
	
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	
	swap_scenes()

func swap_scenes() -> void:
	get_tree().root.add_child(preloaded_scene)
	get_tree().current_scene = preloaded_scene
	queue_free()

func _on_dot_count_timer() -> void:
	dot_count = (dot_count + 1) % 4
	label.text = "Loading" + ".".repeat(dot_count)
