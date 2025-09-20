extends Node2D

var last_screen := -1

func _ready():
	_apply_transparent_pet_flags()
	_center_on_screen()

func _process(_delta):
	pass
	#var current_screen = get_window().current_screen
	#if current_screen != last_screen:
		#last_screen = current_screen
		#_center_on_screen()
		
func _on_screen_changed():
	print("Screen changed:", get_window().current_screen)
	_center_on_screen()

func _on_window_size_changed():
	print("Window size changed:", get_window().size)
	_center_on_screen()

func _center_on_screen():
	var screen = get_window().current_screen
	var screen_size = DisplayServer.screen_get_size(screen)
	var window_size = DisplayServer.window_get_size()
	var pos = (screen_size - window_size) / 2
	DisplayServer.window_set_position(pos, screen)
	
func _apply_transparent_pet_flags():
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, false)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP, false)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, false)

	# Allow per-pixel transparency on macOS
	#ProjectSettings.set_setting("display/window/per_pixel_transparency/allowed", true)
	#ProjectSettings.set_setting("display/window/per_pixel_transparency/enabled", true)
