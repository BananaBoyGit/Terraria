extends Node2D

class_name PlayerMovement

@export var _player: CharacterBody2D

@export_group("Settings")
@export var speed = 300.0
@export var jumpVelocity = -400.0
@export var gravity: float = 1000.0

var moveDirection: float

func _physics_process(delta):
	_ApplyGravity(delta)

	if JumpInput.GetJumpInput() and _player.is_on_floor():
		_ApplyJump()

	_AssignMoveDirection()
	MoveAtDirection(moveDirection)

	_player.move_and_slide()

func _ApplyJump() -> void:
	_player.velocity.y = jumpVelocity

func _ApplyGravity(delta: float) -> void:
	if not _player.is_on_floor():
		_player.velocity.y += gravity * delta

func _AssignMoveDirection() -> void:
	moveDirection = MoveInput.GetMoveInput()

func MoveAtDirection(direction: float) -> void:
	_player.velocity.x = moveDirection * speed
