extends State

class_name PatrolState

@export var _movement: Movement
@export var _character: CharacterBody2D
@export var _characterSeeArea: Area2D
@export var _followState: State

@export_group("Patrol settings")
@export var minPatrolTime: float = 5.0
@export var maxPatrolTime: float = 7.5

signal PatrolNeedChanged

var patrolTimer: SceneTreeTimer 

func Enter() -> void:
	if _movement.GetMoveDirection() == 0.0:
		_movement.SetMoveDirection(GetRandomDirection())
	else:
		_movement.SetMoveDirection(-_movement.GetMoveDirection())
	
	StartPatrolTimer()
	patrolTimer.timeout.connect(_onPatrolEnded)
	_characterSeeArea.body_entered.connect(_OnCharacterSeen)

func _OnCharacterSeen(character: Node) -> void:
	CheckCharactersInSeeAreaOnStealable(character)

func CheckCharactersInSeeAreaOnStealable(character: Node) -> void:
	if character.is_in_group("Stealable"):
		_followState.SetCharacterToFollow(character)
		TransitionToOtherState(_followState)

func StartPatrolTimer() -> void:
	patrolTimer = get_tree().create_timer(GetRandomPatrolTime())
	patrolTimer.timeout.connect(_onPatrolEnded)

func _onPatrolEnded() -> void:
	if _characterSeeArea.get_overlapping_bodies():
		for body in _characterSeeArea.get_overlapping_bodies():
			CheckCharactersInSeeAreaOnStealable(body)
	
	_movement.SetMoveDirection(-_movement.GetMoveDirection())
	StartPatrolTimer()
	
func GetRandomPatrolTime() -> float:
	return randf_range(minPatrolTime, maxPatrolTime)

func GetRandomDirection() -> float:
	var randomValue = randi_range(0, 1) 
	if randomValue == 0:
		return 1.0
	else:
		return -1.0

func Exit() -> void:
	_movement.SetMoveDirection(0.0)
	patrolTimer.timeout.disconnect(_onPatrolEnded)
	_characterSeeArea.body_entered.disconnect(_OnCharacterSeen)
