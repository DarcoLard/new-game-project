extends Node2D


func _on_stay_buton_pressed() -> void:
	get_tree().quit()


func _on_play_buton_pressed() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
