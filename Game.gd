extends Node2D

func _ready():
	$Music.play()
	
func _process(delta):
	if $Player/Camera2D/Control/CanvasLayer/Time.time >= 60:
		$Player.position = ($Position2D.global_position)
		$Player/Camera2D/Control/CanvasLayer/Time.reset()
 
func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		$Key.play()
		$Area2D/Sprite.hide()
		$StaticBody2D.die()
		$Player/Camera2D/Control/CanvasLayer/Time.reset()
		$Player.position = ($Position2D.global_position)
		$Player/Camera2D/Control/CanvasLayer/Time.hide()


func _on_Win_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().change_scene("res://Win.tscn")
