extends Node

class_name AbstractAttack

@export var damage: float = 2.0
@export var reloadTime: float = 0.2

var is_reload: bool

signal Attacked

func Attack(hp: Hp) -> float:
	hp.ApplyDamage(damage)
	Attacked.emit()
	Reload()
	return damage

func Reload() -> void:
	is_reload = false
	await get_tree().create_timer(reloadTime).timeout
	is_reload = true
