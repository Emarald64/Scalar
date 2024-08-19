extends Node2D

@onready var window=get_viewport()
@onready var player=$Player
var base_jump=650
#@onready var PreviousSize = window.size
#@onready var defaultSize = Vector2(window.size)
var screenSize = Vector2(DisplayServer.screen_get_usable_rect().size)
 
#var ignore_Y = false
#var ignore_X = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	window.size=screenSize/1.5
	$AnimatedSprite2D.play()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var windowScale = Vector2(window.size)*1.5 / screenSize
	
	$Player.scale=Vector2.ONE/(min(windowScale.x,windowScale.y)**2)
	$Player.speed=500/min(windowScale.x,windowScale.y)
	$Player.jump_velocity=-base_jump/min(windowScale.x,windowScale.y)
	$Camera2D.zoom=Vector2.ONE*min(windowScale.x,windowScale.y)
