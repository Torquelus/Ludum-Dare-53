## Class that contains all behaviour related to moving the player.
## In this game, the player moves the ball inside a box. Both are rigid bodies.
class_name PlayerController
extends Node3D


## Amount of force applied when moving player ball around.
@export var push_force = 30.0
## Maximum velocity for player ball.
@export var max_velocity = 50.0
## Amount of force player ball jumps upwards with.
@export var jump_force = 600.0

## Direction to apply movement force in.
var _force_dir: Vector3 = Vector3.ZERO


## Rigidbody of player ball.
@onready var player_ball_rigidbody = $PlayerBall
@onready var player_camera = $PlayerCamera


func _ready():
	player_camera.current = true


func _input(event):
	var input_dir = Input.get_vector("move_up", "move_down", "move_left", "move_right")
	_force_dir = Vector3(input_dir.y, 0, input_dir.x)
	
	if event.is_action_pressed("jump"):
		player_ball_rigidbody.apply_force(jump_force * Vector3.UP, Vector3.ZERO)


func _physics_process(_delta):
	if Vector2(player_ball_rigidbody.linear_velocity.x, player_ball_rigidbody.linear_velocity.z).length() < max_velocity:
		player_ball_rigidbody.apply_force(_force_dir * push_force, Vector3.ZERO)
		

