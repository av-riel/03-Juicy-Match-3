extends Node2D




func _on_Next_pressed():
	var _target = get_tree().change_scene("res://Level2.tscn")


func _on_Quit_pressed():
	get_tree().quit()
