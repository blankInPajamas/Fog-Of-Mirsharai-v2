extends CharacterBody2D

const SPEED = 100.0
@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
	
	update_animation()

func update_animation() -> void:
	if velocity == Vector2.ZERO:
		animation.play("idle")
		return

	if abs(velocity.x) > abs(velocity.y):
		if velocity.x > 0:
			animation.play("walk_right")
		else:
			animation.play("walk_left")
	else:
		if velocity.y > 0:
			animation.play("walk_down")
		else:
			animation.play("walk_up")
