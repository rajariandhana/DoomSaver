extends Node2D

@onready var floaters_tree: Node2D = $FloatersTree
var floater_scene: PackedScene
var floaters_list: Array = []

func _ready():
	floater_scene = preload("res://scenes/floater.tscn")
	floaters_list = []
	setup_screen()
	var screen_size = DisplayServer.screen_get_size(get_window().current_screen)
	#var pos = Vector2(randi_range(0, 500), randi_range(0, 500))
	var dir = randi_range(0, Enums.Direction.size() - 1)
	spawn_floater(Vector2(-screen_size.x/2,-screen_size.y/2), dir)
	spawn_floater(Vector2(-screen_size.x/2,screen_size.y/2), dir)
	spawn_floater(Vector2(screen_size.x/2,-screen_size.y/2), dir)
	spawn_floater(Vector2(screen_size.x/2,screen_size.y/2), dir)
	print()

#func _process(_delta):
	#pass
		
func setup_screen():
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_EXTEND_TO_TITLE, true)
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_MAXIMIZED)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, true)
	
func spawn_floater(pos: Vector2, dir: Enums.Direction):
	var floater = floater_scene.instantiate()
	floaters_list.append(floater)
	floaters_tree.add_child(floater)
	floater.set_params(dir, pos)
