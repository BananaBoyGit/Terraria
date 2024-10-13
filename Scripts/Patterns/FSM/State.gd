extends Node

class_name State

signal Transitioned(nextState: State)

func Enter():
	pass

func Update(delta: float):
	pass

func Exit():
	pass
