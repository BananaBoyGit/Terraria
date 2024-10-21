extends Node2D

class_name WeaponDependency

@export var attack: AbstractAttack
@export var weaponAnimation: AnimatedSprite2D

func GetAttack() -> AbstractAttack:
	return attack

func GetWeaponAnimation() -> AnimatedSprite2D:
	return weaponAnimation
