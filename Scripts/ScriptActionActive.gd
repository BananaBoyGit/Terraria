extends Node

class_name ScriptActionActive

static func ToggleProcessMode(node: Node) -> void:
	if node.process_mode == Node.PROCESS_MODE_DISABLED:
		node.process_mode = Node.PROCESS_MODE_INHERIT
	elif node.process_mode == Node.PROCESS_MODE_ALWAYS or node.process_mode == Node.PROCESS_MODE_INHERIT:
		node.process_mode = Node.PROCESS_MODE_DISABLED
