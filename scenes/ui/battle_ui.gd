class_name BattleUI
extends CanvasLayer

@export var char_stats: PlayerShipStats : set = _set_char_stats

@onready var hand = $Hand
@onready var mana_ui = $ManaUI


func _set_char_stats(value: PlayerShipStats)-> void:
	char_stats = value
	mana_ui.char_stats =char_stats
	hand.char_stats = char_stats
