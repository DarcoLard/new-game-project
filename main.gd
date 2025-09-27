extends Node2D

@onready var control = $"Control2"
@onready var timer = $"Control2/Timer"



func _on_play_buton_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")

func _on_control_2_ready() -> void:
	var control = $Control2
	control.visible = false
	await get_tree().create_timer(21.0).timeout
	control.visible = true
