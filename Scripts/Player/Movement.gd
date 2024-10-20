extends Node2D

class_name Movement

@export var _player: CharacterBody2D

@export_group("Settings")
@export var speed = 300.0
@export var gravity: float = 1000.0

var moveDirection: float

func _physics_process(delta):
	_ApplyGravity(delta)
	MoveAtDirection(moveDirection)
	_player.move_and_slide()

func _ApplyGravity(delta: float) -> void:
	if not _player.is_on_floor():
		_player.velocity.y += gravity * delta

func MoveAtDirection(direction: float) -> void:
	_player.velocity.x = moveDirection * speed

func GetMoveDirection() -> float:
	return moveDirection

func SetMoveDirection(newDirection: float) -> void:
	moveDirection = newDirection
