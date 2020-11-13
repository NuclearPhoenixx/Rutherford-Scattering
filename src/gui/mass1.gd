extends LineEdit

func _ready():
	text = str(core.m1 / core.amu)

func _on_MassParticle1_text_entered(new_text):
	if new_text.is_valid_float():
		core.m1 = float(new_text) * core.amu
		#core.reset()
