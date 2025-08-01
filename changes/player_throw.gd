extends RigidBody2D

@export var target : Player
@export var time : float = 1

@onready var timer: Timer = $Timer

var should_throw : Vector2

func _ready() -> void:
	timer.wait_time = time
	timer.start()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_timer_timeout() -> void:
	linear_velocity = target.global_position * 20
