extends StateKeeper

class_name MoveFSMStateKeeper

@export var moveState: MoveState
@export var idleState: IdleState
@export var jumpState: JumpState
@export var fallState: FallState

func GetFallState() -> FallState:
	return fallState

func GetJumpState() -> JumpState:
	return jumpState

func GetMoveState() -> MoveState:
	return moveState

func GetIdleState() -> IdleState:
	return idleState
