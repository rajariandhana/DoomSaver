extends Node2D

@onready var floaters_tree: Node2D = $FloatersTree
var floater_scene: PackedScene
var floaters_list: Array = []

@onready var border_top: StaticBody2D = $Borders/Top
@onready var border_bottom: StaticBody2D = $Borders/Bottom
@onready var border_left: StaticBody2D = $Borders/Left
@onready var border_right: StaticBody2D = $Borders/Right

var screen_size
var thickness = 10

func _ready():
	for child in floaters_tree.get_children():
		child.queue_free() 
	floater_scene = preload("res://scenes/floater.tscn")
	floaters_list = []
	setup_screen()
	screen_size = DisplayServer.screen_get_size(get_window().current_screen)
	setup_borders()
	
	var ctr = randi_range(3, 10)
	for i in ctr:
		var pos_x = randf_range(-300, 300)
		var pos_y = randf_range(-300, 300)
		var dir_x = randf_range(-1, 1)
		var dir_y = randf_range(-1, 1)
		var speed = randf_range(700,1000)
		#spawn_floater(Vector2(x,y),Vector2(0,1),speed)
		spawn_floater(Vector2(pos_x, pos_y),Vector2(dir_x, dir_y),speed)

#func _process(_delta):
	#pass
	
func setup_borders():
	setup_border(border_top, Vector2(0, -screen_size.y/2 + 35), screen_size.x, thickness)
	setup_border(border_bottom, Vector2(0, screen_size.y/2 - 35), screen_size.x, thickness)
	setup_border(border_left, Vector2(-screen_size.x/2 - thickness, 0), thickness, screen_size.y)
	setup_border(border_right, Vector2(screen_size.x/2 + thickness, 0), thickness, screen_size.y)
	
func setup_border(border: StaticBody2D, pos: Vector2, width: float, height: float):
	var collision = border.get_node_or_null("CollisionShape2D")
	if collision and collision.shape is RectangleShape2D:
		var rect_shape = collision.shape as RectangleShape2D
		rect_shape.size = Vector2(width, height)
	border.position = pos
		
func setup_screen():
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_EXTEND_TO_TITLE, true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, true)
	
func spawn_floater(position: Vector2, direction: Vector2, speed: float):
	var floater = floater_scene.instantiate()
	floaters_list.append(floater)
	floaters_tree.add_child(floater)
	floater.set_params(position, direction,speed)
