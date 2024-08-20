extends CharacterBody2D


var speed = 500.0
var jump_velocity = -650.0
var force=200
var hasjumped=false
var started_timer=false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
			#print('st')
		if $AnimatedSprite2D.frame==0 or not $JumpTimer.is_stopped():$AnimatedSprite2D.frame=2
		velocity += get_gravity() * delta
		if not started_timer:
			$JumpTimer.start()
			started_timer=true
	else:
		$AnimatedSprite2D.frame=0
		hasjumped=false
		started_timer=false
	# Handle jump.
	if ((Input.is_action_pressed("jump") and hasjumped) or Input.is_action_just_pressed("jump")) and (not $JumpTimer.is_stopped() or is_on_floor()):
		if not hasjumped:
			$AudioStreamPlayer.play()
			$AnimatedSprite2D.frame=1
		velocity.y+= jump_velocity*delta*(4 if not hasjumped else $JumpTimer.time_left*8)
		hasjumped=true

	if velocity.y>200:$Eyes.position.y=5
	elif velocity.y<-200:$Eyes.position.y=-5
	else:$Eyes.position.y=0


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x= lerp(velocity.x,direction*speed,(15 if is_on_floor() else 5) * delta)

	if move_and_slide() and is_on_floor(): # true if collided
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is CharacterBody2D:
				col.get_collider().velocity=(col.get_normal() * -force)


func _on_hitbox_area_entered(area: Area2D) -> void:
	var type=area.get_meta('pickup','none')
	if type!='none':area.queue_free()
	if type=='scale':
		get_viewport().unresizable=false
		var popup=preload("res://scenes/scale_popup.tscn").instantiate()
		popup.get_node("Button").pressed.connect(close_popup.bind(popup))
		get_parent().get_node("UI").add_child(popup)
		get_tree().paused = true
		get_parent().get_node('Part1/HintTimer').start()
	elif type=='spring':
		get_parent().base_jump*=1.01
		get_parent().get_node("Part1/Label2").text='You can now jump 1% heigher\n you are welcome'

#Alex's jank as heck solution because I didn't feel like giving the popup a script
func close_popup(popup: Node) -> void:
	popup.queue_free()
	get_tree().paused = false
