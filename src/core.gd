extends Node

var ec = 1.602176634/1e19 #elementary charge [C]
var amu = 1.66053906660/1e27 #atomic mass unit [kg]
var vprmtvty = 8.8541878128/1e12 #Vacuum permittivity [F/m]
var a0 = 5.29177210903/1e11 #Bohr radius

var energy = 3e6 #starting energy in eV
var m1 = 1 * amu #Proton
var m2 = 197 * amu #Gold atom nucleus
var q1 = 1 * ec
var q2 = 79 * ec
var b = 1
var time_multi = 1

signal reset

func _ready():
	pass

func reset():
	emit_signal("reset")

func get_power(number):
	var power = 0
	if abs(number) >= 1:
		while number % 10 == 0:
			power += 1
			number /= 10
	else:
		while abs(number) < 1:
			power -= 1
			number *= 10
	
	return power
