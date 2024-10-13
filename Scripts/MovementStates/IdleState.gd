extends MovementState

class_name IdleState

@export var _generalStateChanger:  MovementGeneralStateChanger

func Update(delta: float):
	_generalStateChanger.CheckConditionToChangeStateOnMove()
	_generalStateChanger.CheckConditionToChangeStateOnJump()
