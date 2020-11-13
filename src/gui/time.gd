extends Label

onready var node = get_tree().get_root().get_node("Main")
var thetime = 0

func _ready():
	core.connect("reset",self,"reset")

func reset():
	thetime = 0

func _process(delta):
	thetime += delta / (node.time_m / core.time_multi)
	text = str(stepify(thetime / pow(10,core.get_power(thetime)),0.1)) + " E" + str(core.get_power(thetime)) + " s"
