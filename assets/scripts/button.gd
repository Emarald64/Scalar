extends Area2D

var activated=false
@export var target:Node2D

# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	target.on()


func _on_body_exited(body: Node2D) -> void:
	target.off()
