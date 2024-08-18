extends Node2D

@onready var window=get_viewport()

#@onready var PreviousSize = window.size
@onready var defaultSize = Vector2(window.size)
 
#var ignore_Y = false
#var ignore_X = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var scale = Vector2(window.size) / defaultSize
	
	$Player.scale=Vector2.ONE/(min(scale.x,scale.y)**2)
	$Player.speed=500/min(scale.x,scale.y)
	$Player.jump_velocity=-650/min(scale.x,scale.y)
	$Camera2D.zoom=Vector2.ONE*min(scale.x,scale.y)
