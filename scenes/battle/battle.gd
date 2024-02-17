extends Node2D

@export var char_stats: PlayerShipStats
@onready var battle_ui = $BattleUI
@onready var player_handeler = $PlayerHandeler


func _ready():
	var new_stats: PlayerShipStats = char_stats.create_instance()
	battle_ui.char_stats = new_stats
	start_battle(new_stats)
	
func start_battle(char_stats: PlayerShipStats)-> void:
	player_handeler.start_battle(char_stats)
