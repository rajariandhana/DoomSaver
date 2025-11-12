extends CharacterBody2D

class_name Floater

var DEFAULT_POSITION: Vector2 = Vector2(0,0)
var DEFAULT_DIRECTION: Vector2 = Vector2(1,1)
var DEFAULT_SPEED: float = 500

@onready var label: Label = $Label
@onready var background: ColorRect = $Background
@onready var border: ColorRect = $Border
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var shape_rect = collision_shape_2d.shape as RectangleShape2D

const PADDING = Vector2(10, 6)

var direction: Vector2
var speed: float

func set_params(new_position: Vector2, new_direction: Vector2, new_speed: float, new_text: String) -> void:
	if new_position != null:
		position = new_position
	else:
		position = DEFAULT_POSITION
	if new_direction != null:
		direction = new_direction
	else:
		direction = DEFAULT_DIRECTION
	if new_speed != null:
		speed = new_speed
	else:
		speed = DEFAULT_SPEED
	if new_text != null:
		label.text = new_text
		await get_tree().process_frame
		var text_size = label.get_minimum_size()
		var bg_size = text_size + PADDING * 2
		background.size = bg_size
		label.position = PADDING
		background.position = Vector2.ZERO
		shape_rect.extents = bg_size / 2.0
		collision_shape_2d.position = bg_size / 2.0

func _ready() -> void:
	direction = DEFAULT_DIRECTION
	direction = direction.normalized()
	speed = DEFAULT_SPEED

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())
