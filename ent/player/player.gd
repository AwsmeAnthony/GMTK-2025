extends RigidBody2D
class_name Player

@onready var direction: Line2D = $direction
@onready var down: ShapeCast2D = $down


func _physics_process(delta: float) -> void:
	_aim()
	_shoot()
	down.global_position = global_position - Vector2(0,-64)
	down.global_rotation = 0


func _aim():
	if not Input.is_action_pressed("aim"):
		direction.visible = false
		return
	direction.visible = true
	direction.points[1] = get_local_mouse_position()

func _shoot():
	if not down.is_colliding():
		return
	if Input.is_action_just_released("aim"):
		linear_velocity = (get_global_mouse_position() - global_position) * 1.5
