extends Node2D

export (String) var color
var is_matched
var is_counted
var selected = false
var target_position = Vector2(0,0)
var default_modulate = Color(1,1,1,1)
var highlight = Color(1,0.8,0,1)

var dying = false

var sound_add = null
var sound_remove = null
var sound_move = null
var Effects = null

var icebreaking = preload("res://Icebreaking/Icebreaking.tscn")

func _ready():
	default_modulate = modulate

func _physics_process(_delta):
	if dying:
		queue_free()
	if selected:
		if modulate != highlight:
			modulate = highlight
	else:
		if modulate != default_modulate:
			modulate = default_modulate
		

func move_piece(change):
	target_position = position + change
	position = target_position
	if sound_move == null:
		sound_move = get_node_or_null("/root/Game/Move")
	if sound_move != null:
		sound_move.play()

func die():
	dying = true;
	if sound_remove == null:
		sound_remove = get_node_or_null("/root/Game/Remove")
	if sound_remove != null:
		sound_remove.play()
	if Effects == null:
		Effects = get_node_or_null("root/Game/Effects")
	if Effects != null:
		get_parent().remove_child(self)
		Effects.add_child(self)
		$Timer.wait_time = 0.5 + (randf() / 10.0)
		$Timer.start()
		$Falling.emitting = true


func _on_Timer_timeout():
	if Effects == null:
		Effects = get_node_or_null("/root/Game/Effects")
	if Effects != null:
		var icebreaking = icebreaking.instance()
		icebreaking.position = position
		Effects.add_child(icebreaking)
	dying = true;
		
