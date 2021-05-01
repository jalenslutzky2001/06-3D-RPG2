extends KinematicBody

var speed = 10
var acceleration = 5
var velocity = Vector3.ZERO
var direction = Vector3()
var mouse_sensitivity = 0.1
var gravity = 100

func _ready():
	$AnimationPlayer.play("Idle")
	
func _physics_processed(delta):
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = 10
		velocity.y += gravity *delta
		$AnimationPlayer.play("Jump")
		
func _inpput(event):
	pass
		
func _process(delta):
	direction = Vector3()
	
	if Input.is_action_pressed("backward"):
		direction -= transform.basis.z
		
	elif Input.is_action_pressed("forward"):
		direction +=transform.basis.z
		
	if Input.is_action_pressed("right"):
		direction -= transform.basis.x
	if Input.is_action_pressed("left"):
		direction += transform.basis.x
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	
	



func _on_Area_body_entered(body):
	get_tree().change_scene("res://Win.tscn")


func _on_Conversation_body_entered(body):
	get_tree().change_scene("res://Line1.tscn")
