extends Node2D

@onready var window=get_viewport()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Player.scale=Vector2.ONE*1000/window.size.y
	$Player.speed=500000/window.size.y
	$Player.jump_velocity=-900000/window.size.y
	$Camera2D.zoom=Vector2.ONE*window.size.y/1000
