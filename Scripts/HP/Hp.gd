extends Node

class_name Hp

@export var maxHealthPoints: float = 100.0

var currentHealthPoints: float 

signal Damaged
signal Died

func _ready() -> void:
	SetCurrentHP(maxHealthPoints)

func ApplyDamage(damage: float):
	currentHealthPoints -= damage
	Damaged.emit()
	if IsDied():
		Die()

func IsDied() -> bool:
	return currentHealthPoints <= 0.0

func Die() -> void:
	Died.emit()

func GetMaxHP() -> float:
	return maxHealthPoints

func SetCurrentHP(newHP: float):
	currentHealthPoints = newHP

func GetCurrentHP() -> float:
	return currentHealthPoints
