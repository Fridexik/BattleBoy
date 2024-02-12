class_name Enemy
extends Area2D

const OFFSET_ARROW := 5

@export var stats: Stats : set = set_enemy_stats

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var arrow: Sprite2D = $Arrow
@onready var stats_ui:StatsUI = $StatsUI as StatsUI

func _ready():
	stats.block=5
	

func set_enemy_stats(value: Stats) -> void:
	stats= value.create_instance()
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
		
	update_enemy()
	
	
func update_enemy()-> void:
	if not stats is Stats:
		return
	if not is_inside_tree():
		await ready
		
	sprite_2d.texture = stats.art
	sprite_2d.rotation_degrees = -90
	arrow.scale= sprite_2d.scale*3.5
	update_stats()
	

func update_stats()->void:
	stats_ui.update_stats(stats)
	
func take_damage(damage: int) -> void:
	if stats.health <=0:
		return
	stats.take_damamge(damage)
	
	if stats.health <=0:
		queue_free()


func _on_area_entered(_area):
	arrow.show() # Replace with function body.


func _on_area_exited(_area):
	arrow.hide() # Replace with function body.
