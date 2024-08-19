extends Area2D

var saved={}

# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("reset") and get_parent().player in get_overlapping_bodies():
		print('reset')
		for object in get_overlapping_bodies():
			if object.name in saved:
				object.position=saved[object.name]
			else:queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.name=='Player':
		saved.clear()
		print(len(get_overlapping_bodies()))
		for object in get_overlapping_bodies():
			saved[object.name]=object.position
		print(saved)
