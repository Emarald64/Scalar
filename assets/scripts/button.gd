extends Area2D

var activated=false
@export var target:Node2D
var on=false

# Called when the node enters the scene tree for the first time.

func _process(delta: float) -> void:
	if has_overlapping_bodies() and not on:
		target.on()
		on=true
		$Sprite2D.texture=preload("res://assets/Button_0002.png")
		print('on')
	elif not has_overlapping_bodies() and on:
		target.off()
		on=false
		$Sprite2D.texture=preload("res://assets/Button_0001.png")
		print('off')

#func _on_body_entered(body: Node2D) -> void:
	#target.on()
#
#
#func _on_body_exited(body: Node2D) -> void:
	#target.off()
