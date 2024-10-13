extends RefCounted

class_name MoveInput

static func GetMoveInput() -> float:
	return Input.get_axis("PlayerLeft", "PlayerRight")
