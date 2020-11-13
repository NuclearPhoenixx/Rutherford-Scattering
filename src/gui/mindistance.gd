extends Label

onready var node = get_tree().get_root().get_node("Main")

var mind = -1

func _ready():
	core.connect("reset",self,"reset")

func reset():
	mind = -1

func _process(delta):
	var dist = (node.p0 - node.p1).length()
	
	if dist < mind or mind == -1:
		text = "Min distance = " + str(stepify(dist / core.a0,0.0001)) + " a0"
		mind = dist
