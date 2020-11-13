extends Label

onready var node = get_tree().get_root().get_node("Main")

func _process(delta):
	var ekin = 0.5 * core.m2 * node.v1.length_squared() / core.ec
	text = "Ekin2 = " + str(stepify(ekin / 1e3,0.01)) + " keV"
