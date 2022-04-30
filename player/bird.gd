extends KinematicBody2D

var velocity = Vector2(0,0)
export var GRAVITY = 1800
export var FLAPFORCE = -500
var death

func _ready():
	death = get_parent().get_node("Death").get_child(0)

func _physics_process(delta):
	velocity.y += GRAVITY * delta
	if Input.is_action_just_pressed("flap"):
		velocity.y = FLAPFORCE
		$AnimatedSprite.play("flap")
	
	velocity = move_and_slide(velocity, Vector2.UP)
	

func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.stop()


func _on_ground_body_entered(body):
	if body.name == "bird":
		body.visible = false
		death.play("modulate")
		yield(death, "animation_finished")
		get_tree().reload_current_scene()
		


