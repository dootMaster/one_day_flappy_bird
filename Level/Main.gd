extends Node2D

var points = 0

func _ready():
	pass
	
func _process(_delta):
	$Points.text = String(points)
	
func increment_points():
	points += 1
