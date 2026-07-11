extends CanvasLayer

@onready var basepad: TextureRect = $pad_img/basepad
@onready var basepad_up: TextureRect = $pad_img/basepad_up
@onready var basepad_down: TextureRect = $pad_img/basepad_down
@onready var basepad_left: TextureRect = $pad_img/basepad_left
@onready var basepad_right: TextureRect = $pad_img/basepad_right
@onready var btn_a: TextureRect = $pad_img/btn_a

@onready var texture_rect_list: Array[TextureRect] = [basepad, basepad_up, basepad_down, basepad_left, basepad_right]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_turn_on_visibility(basepad)


func _process(delta: float) -> void:
	pass


func _on_d_up_button_up() -> void:
	_turn_on_visibility(basepad)
	Input.action_release("ui_up")


func _on_d_up_button_down() -> void:
	_turn_on_visibility(basepad_up)
	Input.action_press("ui_up")
	
	
func _on_d_down_button_up() -> void:
	_turn_on_visibility(basepad)
	Input.action_release("ui_down")

func _on_d_down_button_down() -> void:
	_turn_on_visibility(basepad_down)
	Input.action_press("ui_down")


func _on_d_right_button_up() -> void:
	_turn_on_visibility(basepad)
	Input.action_release("ui_right")

func _on_d_right_button_down() -> void:
	_turn_on_visibility(basepad_right)
	Input.action_press("ui_right")


func _on_d_left_button_up() -> void:
	_turn_on_visibility(basepad)
	Input.action_release("ui_left")


func _on_d_left_button_down() -> void:
	_turn_on_visibility(basepad_left)
	Input.action_press("ui_left")

func _turn_on_visibility(name_rect: TextureRect) -> void:
	for i in texture_rect_list:
		if i == name_rect: 
			i.visible = true
		else: 
			i.visible = false
	return 



func _on_btn_ok_button_up() -> void:
	Global.interact_pressed.emit()


func _on_btn_ok_button_down() -> void:
	pass # Replace with function body.


func _on_guess_btn_pressed() -> void:
	Global.TARGET_PATH = "res://scenes/guess.tscn"
	get_tree().change_scene_to_file("res://scenes/loading.tscn")
	pass # Replace with function body.
