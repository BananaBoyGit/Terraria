extends State

class_name ThiefEnemyAttackState

@export var _attack: AbstractAttack
@export var _patrolState: State

var hp: Hp

func Enter():
	_attack.Attack(hp)
	TransitionToOtherState(_patrolState)

func SetHpForAttack(newHp: Hp) -> void:
	hp = newHp

func Exit() -> void:
	hp = null
