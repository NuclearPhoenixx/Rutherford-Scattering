extends Button

func _process(_delta):
	if get_tree().paused:
		text = "Play"
	else:
		text = "Pause"

func _on_PlayPause_pressed():
	get_tree().paused = !get_tree().paused
