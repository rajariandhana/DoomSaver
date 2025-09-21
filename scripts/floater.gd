extends CharacterBody2D

class_name Floater

var DEFAULT_POSITION: Vector2 = Vector2(0,0)
var DEFAULT_DIRECTION: Vector2 = Vector2(1,1)
var DEFAULT_SPEED: float = 500

var direction: Vector2
var speed: float

func set_params(new_position: Vector2, new_direction: Vector2, new_speed: float) -> void:
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

func _ready() -> void:
	direction = DEFAULT_DIRECTION
	direction = direction.normalized()
	speed = DEFAULT_SPEED

func _physics_process(delta: float) -> void:
	velocity = direction * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		direction = direction.bounce(collision.get_normal())
