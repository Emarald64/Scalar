extends Area2D

@onready var window=get_viewport()

func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":window.unresizable=true
	print("can't resize")


func _on_body_exited(body: Node2D) -> void:
	if body.name=="Player":window.unresizable=false
