extends GeneralStateChanger

class_name MovementGeneralStateChanger

@export var _character: CharacterBody2D
@export var _FSM: FSM
@export var _stateKeeper: MoveFSMStateKeeper

func CheckConditionToChangeStateOnFall():
	if !_character.is_on_floor():
		_FSM.currentState.Transitioned.emit(_stateKeeper.GetFallState())

func CheckConditionToChangeStateOnMove():
	if MoveInput.GetMoveInput():
		_FSM.currentState.Transitioned.emit(_stateKeeper.GetMoveState())

func CheckConditionToChangeStateOnJump():
	if _character.is_on_floor() and JumpInput.GetJumpInput():
		_FSM.currentState.Transitioned.emit(_stateKeeper.GetJumpState())
