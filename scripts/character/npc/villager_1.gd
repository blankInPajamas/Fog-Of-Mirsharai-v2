extends CharacterBody2D

func _on_interact_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group('zahra'):
		print("entered")


func _on_interact_detection_body_exited(body: Node2D) -> void:
	if body.is_in_group('zahra'):
		print('exited')
