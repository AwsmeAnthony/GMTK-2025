extends Node2D


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var flag: Area2D = $flag

func _ready() -> void:
	if Global.world_type == 1:
		animation_player.play("day_2")
	elif Global.world_type == 2:
		animation_player.play("day_3")
		flag.next_world = preload("res://world/world3/world_3_2.tscn")
	elif Global.world_type == 4:
		flag.next_world = preload("res://world/world3/world_3_3.tscn")
