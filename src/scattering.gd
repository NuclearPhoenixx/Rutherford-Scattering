extends Control

var scale_m = 1e15 # Scale multiplier
var time_m = 1e21 # Time divider

var m0
var m1
var q0
var q1
var p0
var p1
var v0
var v1
var r0 = 5 # Pixel size
var r1 = 20 # Size approximation


func reset():
	m0 = core.m1
	m1 = core.m2
	q0 = core.q1
	q1 = core.q2
	
	p0 = Vector2(OS.window_size.x/6, 2*OS.window_size.y/3) / scale_m
	p0 -= OS.window_size / scale_m / 2
	p0.y *= core.b
	p1 = Vector2(3*OS.window_size.x/7, 2*OS.window_size.y/3) / scale_m
	p1 -= OS.window_size / scale_m / 2
	p1.x += 0.005 * core.a0
	v0 = Vector2(1,0)
	v1 = Vector2(0,0)
	v0 *= sqrt(2*core.energy*core.ec/m0)
	#print("E'/E(proton): " + str((m1-m0)/(m0+m1)))


func _ready():
	core.connect("reset",self,"reset")
	reset()


func _draw():
	# Offset to not move relative to window size
	var window_offset = OS.window_size / 2
	
	draw_circle(p0 * scale_m + window_offset, r0, Color.red)
	draw_circle(p1 * scale_m + window_offset, r1, Color.blue)
	draw_circle((m0*p0 + m1*p1) / (m0+m1) * scale_m + window_offset, 2, Color.green) # Center of mass


func get_acceleration(m,p_1,p_2):
	var k = (q0*q1) / (4*PI*core.vprmtvty)
	var r = p_1 - p_2
	return k/m * r/pow(r.length(),3)


func _process(delta):
	delta /= (time_m / core.time_multi)
	
	p0 += v0 * delta 
	p1 += v1 * delta
	
	update()
	
	v0 += get_acceleration(m0,p0,p1) * delta
	v1 += get_acceleration(m1,p1,p0) * delta
	
	#print(str(m0*v0.length_squared()/2/ec/1e6)+" MeV")
