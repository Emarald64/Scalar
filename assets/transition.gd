extends Area2D

@export var next_part:String


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		var part=get_tree().root.get_node('Main/'+next_part)
		part.create_instance.call_deferred()
		get_parent().queue_free()
