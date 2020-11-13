extends HSlider

func _ready():
	value = core.b

func _on_B_value_changed(value):
	core.b = value
	core.reset()
