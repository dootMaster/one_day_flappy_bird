extends Area2D

var timer
var wall_manager
var death
var bird

export var WALLSPEED = -8

func _ready():
	timer = get_parent().get_node("WallTimer")
	wall_manager = get_parent().get_node("wall_reset")
	death = get_parent().get_node("Death").get_child(0)
	bird = get_parent().get_node("bird")

func _physics_process(_delta):
	position += Vector2(WALLSPEED, 0)

func _on_Walls_body_entered(body):
	if body.name == "bird":
		bird.visible = false
		death.play("modulate")
		yield(death, "animation_finished")
		get_tree().reload_current_scene()


func _on_point_gate_body_entered(body):
	if body.name == "bird":
		get_parent().increment_points()
		timer.wait_time = timer.wait_time - .02
		wall_manager.increment_range()
