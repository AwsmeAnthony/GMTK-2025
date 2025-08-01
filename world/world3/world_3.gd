extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	if Global.world_type == 1:
		animation_player.play("day_2")
