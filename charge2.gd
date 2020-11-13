extends LineEdit

func _ready():
	text = str(core.q2 / core.ec)

func _on_ChargeParticle2_text_entered(new_text):
	if new_text.is_valid_float():
		core.q2 = float(new_text) * core.ec
		#core.reset()
