## Class that contains all behaviour related to moving the player.
## In this game, the player moves the ball inside a box. Both are rigid bodies.
class_name PlayerController
extends Node3D


## Signal that gets emitted when label hits something
signal label_side

## Amount of force applied when moving player ball around.
@export var push_force = 30.0
## Maximum velocity for player ball.
@export var max_velocity = 50.0
## Amount of force player ball jumps upwards with.
@export var jump_force = 600.0
## Amount needed to trigger audio sound effects
@export var min_velocity = 5
## Height that player should not reach (death floor)
@export var death_floor = -30

## Direction to apply movement force in.
var _force_dir: Vector3 = Vector3.ZERO

## Rigidbody of player ball.
@onready var player_ball_rigidbody: RigidBody3D = $PlayerBall
@onready var player_box_rigidbody: RigidBody3D = $Box
@onready var player_camera: Camera3D = $PlayerCamera

## Stored player sound volume of rolling
@onready var old_rolling_volume = $Player_Sounds.volume_db
@onready var raycast = $Box/RayCast3D

var _is_grounded = false


func _ready():
	player_camera.current = true


func _input(event):
	var input_dir = Input.get_vector("move_up", "move_down", "move_left", "move_right")
	_force_dir = Vector3(input_dir.y, 0, input_dir.x)
	
	if _is_grounded and event.is_action_pressed("jump"):
		$Jump_Sound.play(0.13)
		player_ball_rigidbody.apply_force(jump_force * Vector3.UP, Vector3.ZERO)


func _physics_process(_delta):
	if Vector2(player_ball_rigidbody.linear_velocity.x, player_ball_rigidbody.linear_velocity.z).length() < max_velocity:
		player_ball_rigidbody.apply_force(_force_dir * push_force, Vector3.ZERO)
		
		## Play rolling sound if total velocity > min_velocity, otherwise quiet it and eventaully turn off
		if (Vector2(player_ball_rigidbody.linear_velocity.x, player_ball_rigidbody.linear_velocity.z).length() > min_velocity)  :
			if($Player_Sounds.playing!=true):
				$Player_Sounds.seek(1)
				$Player_Sounds.play()
			if($Player_Sounds.volume_db<old_rolling_volume):
				$Player_Sounds.volume_db = $Player_Sounds.volume_db + 0.5
				
		elif($Player_Sounds.playing==true && (Vector2(player_ball_rigidbody.linear_velocity.x, player_ball_rigidbody.linear_velocity.z).length() < min_velocity)):
			if($Player_Sounds.volume_db <= (old_rolling_volume-10)):
				$Player_Sounds.stop()
			else:
				$Player_Sounds.volume_db =$Player_Sounds.volume_db - 0.2
			
	# This is how we reset if we go too far
	if (player_box_rigidbody.position.y < death_floor):
		get_tree().reload_current_scene()

	raycast.global_rotation = Vector3.ZERO
	if raycast.is_colliding():
		_is_grounded = true
	else:
		_is_grounded = false
		

func _on_area_3d_body_entered(body):
	label_side.emit()
