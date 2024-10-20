extends State

class_name FollowState

@export var _movement: Movement
@export var _selfCharacter: Node2D
@export var _characterAttackArea: Area2D
@export var _patrolState: State
@export var _attackState: State

var character: Node2D

func Enter():
	_characterAttackArea.body_entered.connect(_OnAttackAreaEntered)

func FixedUpdate(delta: float):
	if !character:
		TransitionToOtherState(_patrolState)
	else:
		_movement.SetMoveDirection((_selfCharacter.global_position.direction_to(character.global_position)).normalized().x)

func _OnAttackAreaEntered(body: Node):
	if body == character:
		for node in character.get_children():
			if node is Hp:
				_attackState.SetHpForAttack(node)
		TransitionToOtherState(_attackState)

func SetCharacterToFollow(newCharacter: Node2D) -> void:
	character = newCharacter

func Exit() -> void:
	_characterAttackArea.body_entered.disconnect(_OnAttackAreaEntered)
	character = null
