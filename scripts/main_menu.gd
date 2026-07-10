extends Control

'''
- Makes the btns functional
- Make the title and btns appear through transition
'''

@onready var settings_panel: Control = $settings_panel
@onready var title_game: Label = $primary_panel/Label
@onready var primary_panel: Control = $primary_panel


func _ready() -> void:
	settings_panel.visible = false
	primary_panel.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_btn_pressed() -> void:
	get_tree().quit()


func _on_start_btn_pressed() -> void:
	Global.TARGET_PATH = 'res://scenes/storytell.tscn'
	TransitionScene.transition()
	await TransitionScene.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/loading.tscn")


func _on_settings_btn_pressed() -> void:
	primary_panel.visible = false
	settings_panel.visible = true


func _on_back_btn_pressed() -> void:
	settings_panel.visible = false
	primary_panel.visible = true
