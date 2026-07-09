extends Control

@onready var scroll_container: ScrollContainer = $TextScroll
@onready var story_label: Label = $TextScroll/StoryLabel

var story_text: Array[String] = [
	"The phone buzzes against the desk. A message from her cousin flashes on the screen, filled with exclamation marks and plans for the upcoming week.",
	"Mirsharai was supposed to be an escape. A quiet, green sanctuary away from the relentless noise of the city, and the perfect place for her long-awaited holiday.",
	"Pack a bag, board the transport, watch the concrete high-rises give way to rolling hills and open fields... Zahra lets herself relax for the first time in months.",
	"But anticipation carries a strange weight. Deep down, a lifetime of tracking shadows leaves an echo in her mind—a quiet whisper that peace is rarely given freely.",
	"The moment her feet touch the ground at Mirsharai, the idyllic warmth vanishes. The air feels heavy, sharp, and entirely too still.",
	"There are no welcoming smiles at the station. Instead, a panicked crowd has gathered near the edge of the clearing, their whispers frantic and terrified.",
	"Pushing through the onlookers, her instincts take over before she even realizes it. The holiday is over. The familiar, cold reality of a crime scene locks into place.",
	"A body lies in the brush. A brutal murder in a town that standard law enforcement isn't equipped to handle.",
	"Being a detective isn't a job you can just switch off. Looking down at the chaotic scene, Zahra realizes it is entirely up to her to piece together the clues and discover who the killer is."
]

var current_line: int = 0
var delay_per_char: float = 0.04
var tween: Tween
var is_typing: bool = false

func _ready() -> void:
	show_line(current_line)

func _process(_delta: float) -> void:
	# If text is actively typing out, force the scroll container downwards
	if is_typing:
		scroll_to_bottom()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if is_typing:
			skip_to_end()
		else:
			advance_story()

func show_line(line_index: int) -> void:
	if line_index >= story_text.size():
		end_story_sequence()
		return

	is_typing = true
	story_label.text = story_text[line_index]
	story_label.visible_characters = 0

	var total_time = story_label.text.length() * delay_per_char

	tween = create_tween()
	tween.tween_property(story_label, "visible_characters", story_label.text.length(), total_time)
	tween.finished.connect(_on_line_finished)

func _on_line_finished() -> void:
	is_typing = false
	# One final scroll adjustment to make sure the last line is fully framed
	await get_tree().process_frame
	scroll_to_bottom()

func skip_to_end() -> void:
	if tween and tween.is_running():
		tween.kill()
	story_label.visible_characters = story_label.text.length()
	_on_line_finished()

func advance_story() -> void:
	current_line += 1
	show_line(current_line)

func scroll_to_bottom() -> void:
	# Gets the scrollbar component and matches the scroll position to its max length
	var v_scrollbar = scroll_container.get_v_scroll_bar()
	scroll_container.scroll_vertical = int(v_scrollbar.max_value)

func end_story_sequence() -> void:
	story_label.text = ""
	Global.TARGET_PATH = 'res://scenes/main.tscn'
	get_tree().change_scene_to_file("res://scenes/loading.tscn")
	print("Introduction finished!")
