extends LineEdit

func _ready():
	text = str(core.q1 / core.ec)

func _on_ChargeParticle1_text_entered(new_text):
	if new_text.is_valid_float():
		core.q1 = float(new_text) * core.ec
		#core.reset()
