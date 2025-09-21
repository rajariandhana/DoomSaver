extends Area2D

class_name Floater

var direction: Enums.Direction
var speed: int

func set_params(new_direction: Enums.Direction, position: Vector2):
	direction = new_direction
	self.position = position
	print(self.position)
	print(self.global_position)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
