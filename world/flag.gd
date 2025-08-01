extends Area2D

@export var next_world : PackedScene
@export var fill : Vector2

@onready var texture_rect: TextureRect = $CanvasLayer/Control/TextureRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	texture_rect.texture.set("fill_from",fill)

func _on_body_entered(body: Node2D) -> void:
	if not body is Player:
		return
	if next_world == null:
		return
	
	animation_player.play("end")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "end":
		get_tree().change_scene_to_packed(next_world)
