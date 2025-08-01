extends Control

@export var recource : TalkingResource

@onready var texture_rect: TextureRect = $TextureRect
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var timer: Timer = $timer
@onready var label: Label = $Label
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var index : int = 0
var ending : bool = false
var dialog_reses : Array = [
	preload("res://spice/dialog1.tres")
	,preload("res://spice/dialog2.tres")
	,preload("res://spice/dialog3.tres")
	,preload("res://spice/dialog4.tres")
]


func _ready() -> void:
	recource = dialog_reses[Global.world_type]
	Music.volume_db = -60

func _physics_process(delta: float) -> void:
	if ending:
		return
	texture_rect.texture.noise.set("seed",randi())


func _on_audio_stream_player_finished() -> void:
	audio_stream_player.play()

func _shift_dialog():
	if recource.text[index] == "END":
		animation_player.play("end")
		var sound_tween : Tween = create_tween()
		sound_tween.tween_property(Music,"volume_db",-15,0.5)
		label.text = ""
		return
		
		
	label.text = recource.text[index]
	timer.wait_time = recource.timing[index]
	timer.start()
	index += 1
	
	return false

func _on_timer_timeout() -> void:
	_shift_dialog()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if Global.world_type < 5:
		Global.world_type += 1
	get_tree().change_scene_to_file("res://world/world1/world.tscn")
