extends Villager

@export var dialogic_character: DialogicCharacter
@onready var bubble_anchor: Marker2D = $Marker2D

var zahra_in_range: bool = false

func _ready() -> void:
	Global.interact_pressed.connect(_when_in_range)

func _on_interact_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group('zahra'):
		zahra_in_range = true

func _on_interact_detection_body_exited(body: Node2D) -> void:
	if body.is_in_group('zahra'):
		zahra_in_range = false
		if Dialogic.current_timeline and Dialogic.current_timeline.resource_path == "res://timelines/imam_yusuf.dtl":
			Dialogic.end_timeline()

func start_dialogue(timeline_path: String) -> void:
	var layout = Dialogic.start(timeline_path)
	layout.register_character(dialogic_character, bubble_anchor)
	await get_tree().process_frame
	layout.register_character(dialogic_character, bubble_anchor)

func _when_in_range() -> void:
	if zahra_in_range and Dialogic.current_timeline == null:
		start_dialogue("res://timelines/imam_yusuf.dtl")
