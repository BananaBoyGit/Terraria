extends AnimatedSprite2D

class_name CharacterAnimation

@export var _character: CharacterBody2D

@export_group("Animations name")
@export var moveAnimation: String = "Move"
@export var idleAnimation: String = "Idle"

var prioretyAnimationPlayed: bool = false
var animationPriorety: int

func _physics_process(delta: float):
	if _character.velocity.x != 0.0:
		PlaySimpleAnimation(moveAnimation)
	else:
		PlaySimpleAnimation(idleAnimation)
	
	
	FlipSpriteAtVelocityX(_character.velocity.x)

func PlaySimpleAnimation(animationName: String):
	if prioretyAnimationPlayed:
		return
	play(animationName)

func PlayPrioretyAnimation(animationName: String, priorety: int):
	prioretyAnimationPlayed = true
	if priorety >= animationPriorety:
		animationPriorety = priorety
		stop()
		play(animationName)
		animation_finished.connect(_OnPrioretyAnimationFinished)

func FlipSpriteAtVelocityX(velocityX: float) -> void:
	if velocityX < 0.0:
		flip_h = true
	elif velocityX > 0.0: 
		flip_h = false

func _OnPrioretyAnimationFinished() -> void:
	animation_finished.disconnect(_OnPrioretyAnimationFinished)
	animationPriorety = 0

