extends AnimatedSprite

func _ready():
	play()

func _on_Icebreaking_animation_finished():
	queue_free()
