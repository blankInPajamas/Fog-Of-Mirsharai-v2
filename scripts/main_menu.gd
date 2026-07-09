extends Control

'''
- Makes the btns functional
- Make the title and btns appear through transition
'''

@onready var title_game: Label = $Label


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_btn_pressed() -> void:
	get_tree().quit()


func _on_start_btn_pressed() -> void:
	Global.TARGET_PATH = 'res://scenes/storytell.tscn'
	get_tree().change_scene_to_file("res://scenes/loading.tscn")


func _on_settings_btn_pressed() -> void:
	pass # Replace with function body.
