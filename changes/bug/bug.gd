extends CharacterBody2D

@onready var sprite: Sprite2D = $sprite

var start_pos : Vector2 

func _ready() -> void:
	start_pos = global_position
	velocity.x = 160

func _physics_process(delta: float) -> void:
	
	if global_position.distance_to(start_pos) > 256:
		velocity.x *= -1
		if sprite.flip_h:
			sprite.flip_h = false
		else:
			sprite.flip_h = true
	
	move_and_slide()
