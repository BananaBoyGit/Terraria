extends MovementState

class_name FallState

@export var gravity: float = 1000.0

func _physics_process(delta):
	_character.velocity.y += gravity * delta

func Update(delta: float) -> void:
	_character.velocity.x = MoveInput.GetMoveInput() * _stateKeeper.GetMoveState().GetSpeed()
	_character.move_and_slide()
	CheckConditionToChangeIdleState()

func CheckConditionToChangeIdleState() -> void:
	if _character.is_on_floor():
		Transitioned.emit(_stateKeeper.GetIdleState())
