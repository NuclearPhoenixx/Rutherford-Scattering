extends HSlider

func _ready():
	value = core.time_multi

func _on_TimeSpeed_value_changed(value):
	core.time_multi = value
	#core.reset()
