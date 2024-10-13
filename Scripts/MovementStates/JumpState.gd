extends MovementState

class_name JumpState

@export var _generalStateChanger:  MovementGeneralStateChanger
@export var _jumpVelocity: float = 400.0

func Update(delta: float) -> void:
	_character.velocity.y = -_jumpVelocity
	_character.move_and_slide()
	_generalStateChanger.CheckConditionToChangeStateOnFall()
