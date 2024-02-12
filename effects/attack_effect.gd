class_name AttackEffect
extends Effect

var amount := 0


func execute(targets: Array[Node]) ->void:
	for target in targets:
		if not target:
			return
		if target is Enemy or target is Player:
			target.take_damage(amount)
			
			


