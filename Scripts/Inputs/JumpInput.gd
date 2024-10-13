extends RefCounted

class_name JumpInput

static func GetJumpInput() -> Variant:
	return Input.is_action_just_pressed("PlayerJump")
