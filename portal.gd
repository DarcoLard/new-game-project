extends Node

const SPEED = 0
const JUMP_VELOCITY = 0


@onready var anim = get_node("AnimatedSprite2D")
 


func _process(delta):
	$AnimatedSprite2D.play("portal idle")


@export var target_scene: PackedScene  # set this in the Inspector


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # make sure only the player triggers it
		get_tree().change_scene_to_file("res://big_boss_room.tscn")
