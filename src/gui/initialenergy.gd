extends LineEdit

func _ready():
	text = str(core.energy / 1e6)

func _on_InitialEnergy_text_entered(new_text):
	if new_text.is_valid_float():
		core.energy = float(new_text) * 1e6
		#core.reset()
