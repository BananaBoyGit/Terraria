extends Node

# To create additional states
class_name State

# Emitted to trigger a state change. Called when you need to switch to another state.
signal Transitioned

## Called when transitioning into this state
func Enter() -> void:
	pass

## Overrides _process(delta)
func Update(delta: float) -> void:
	pass

## Overrides _physics_process(delta)
func FixedUpdate(delta: float) -> void:
	pass

## Called when transitioning out of this state
func Exit() -> void:
	pass

## Emits a signal to transition to the specified state
func TransitionToOtherState(state: State) -> void:
	Transitioned.emit(state)
