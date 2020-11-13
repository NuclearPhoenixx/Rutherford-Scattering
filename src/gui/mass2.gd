extends LineEdit

func _ready():
	text = str(core.m2 / core.amu)

func _on_MassParticle2_text_entered(new_text):
	if new_text.is_valid_float():
		core.m2 = float(new_text) * core.amu
		#core.reset()
