extends Node2D

@onready var character: Node2D = $Character

func _ready():
	_apply_transparent_pet_flags()
	_center_on_screen()
	pass

#func _process(_delta):
	#pass
		
func _center_on_screen():
	var screen = get_window().current_screen
	var screen_size = DisplayServer.screen_get_size(screen)
	var window_size = DisplayServer.window_get_size()
	var pos = (screen_size - window_size) / 2
	DisplayServer.window_set_position(pos, screen)

func _apply_transparent_pet_flags():

	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_TRANSPARENT, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_ALWAYS_ON_TOP, true)
	DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_MOUSE_PASSTHROUGH, true)

	# Allow per-pixel transparency on macOS
	#ProjectSettings.set_setting("display/window/per_pixel_transparency/allowed", true)
	#ProjectSettings.set_setting("rendering/viewport/transparent_background", true)
