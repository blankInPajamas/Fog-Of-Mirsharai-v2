extends Control

@onready var points_label: Label = $interrogate_panel/points_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_set_points_to_label()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _set_points_to_label() -> void:
	points_label.text = "You have " + str(Global.INTERROGATE_POINTS) + " points left"


func _on_karim_pressed() -> void:
	pass # Replace with function body.


func _on_imam_yusuf_pressed() -> void:
	pass # Replace with function body.


func _on_nasrin_pressed() -> void:
	pass # Replace with function body.


func _on_priya_pressed() -> void:
	pass # Replace with function body.


func _on_anwar_pressed() -> void:
	pass # Replace with function body.


func _on_farhan_pressed() -> void:
	pass # Replace with function body.


func _on_final_guess_pressed() -> void:
	pass # Replace with function body.
