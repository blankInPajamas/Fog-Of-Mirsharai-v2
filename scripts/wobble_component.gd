extends Node
class_name WobbleComponent

@export var wobble_speed: float = 4.0
@export var wobble_strength: float = 0.05
@export var enabled: bool = true

var time: float = 0.0
var sprite: Node2D # Can be Sprite2D or AnimatedSprite2D
var base_scale: Vector2

func _ready() -> void:
	# Safely look for either type of sprite node on the parent NPC
	if get_parent().has_node("Sprite2D"):
		sprite = get_parent().get_node("Sprite2D")
	elif get_parent().has_node("AnimatedSprite2D"):
		sprite = get_parent().get_node("AnimatedSprite2D")
		
	if sprite:
		base_scale = sprite.scale
	else:
		push_warning("WobbleComponent: No Sprite2D or AnimatedSprite2D found on parent!")

func _process(delta: float) -> void:
	if not enabled or not sprite:
		return
		
	time += delta
	
	# Handle the continuous squash and stretch
	var squish = sin(time * wobble_speed) * wobble_strength
	#sprite.scale.x = base_scale.x + squish
	sprite.scale.y = base_scale.y - squish
