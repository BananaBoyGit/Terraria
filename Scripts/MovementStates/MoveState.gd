extends MovementState

class_name MoveState

@export var _generalStateChanger: MovementGeneralStateChanger
@export_group("Move settings")
@export var speed: float = 300.0

var moveDirection: float

func Update(delta: float) -> void:
	moveDirection = MoveInput.GetMoveInput()
	_character.velocity.x = speed * moveDirection
	_character.move_and_slide()
	
	CheckConditionToChangeToIdleState()
	_generalStateChanger.CheckConditionToChangeStateOnJump()

func CheckConditionToChangeToIdleState() -> void:
	if _character.velocity == Vector2.ZERO:
		Transitioned.emit(_stateKeeper.GetIdleState())

func GetSpeed() -> float:
	return speed
