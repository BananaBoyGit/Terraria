extends Movement

class_name PlayerMovement

@export var jumpVelocity = -400.0

func _ApplyJump() -> void:
	_player.velocity.y = jumpVelocity

func _AssignMoveDirection() -> void:
	moveDirection = MoveInput.GetMoveInput()

func _physics_process(delta):
	_AssignMoveDirection()
	super._physics_process(delta)
	if JumpInput.GetJumpInput() and _player.is_on_floor():
		_ApplyJump()
