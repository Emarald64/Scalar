extends CharacterBody2D


var speed = 500.0
var jump_velocity = -900.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	# Handle jump.
	elif Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x= lerp(velocity.x,direction*speed,(15 if is_on_floor() else 5) * delta)

	move_and_slide()


func _on_hitbox_area_entered(area: Area2D) -> void:
	area.queue_free()
	get_viewport().unresizable=false
	var popup=preload("res://scenes/scale_popup.tscn").instantiate()
	popup.get_node("Button").pressed.connect(close_popup.bind(popup))
	get_parent().get_node("UI").add_child(popup)
	get_tree().paused = true

#Alex's jank as heck solution because I didn't feel like giving the popup a script
func close_popup(popup: Node) -> void:
	popup.queue_free()
	get_tree().paused = false
