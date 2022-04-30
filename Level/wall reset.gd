extends Area2D

var Wall = preload("res://Level/Wall.tscn")
var hi_range = -50
var low_range = 50

func _ready():
	pass

func Wall_reset():
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(1024, rand_range(hi_range, low_range))
	get_parent().call_deferred("add_child", Wall_instance)


func _on_WallTimer_timeout():
	Wall_reset()


func _on_wall_reset_area_entered(area):
	area.queue_free()
	
func increment_range():
	if low_range < 150:
		hi_range -= 2
		low_range += 2
