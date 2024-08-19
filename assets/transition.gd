extends Area2D

@export var next_part:String

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_body_entered(body: Node2D) -> void:
	if body.name=="Player":
		get_tree().root.get_node('Main/'+next_part).create_instance()
		get_parent().queue_free()
