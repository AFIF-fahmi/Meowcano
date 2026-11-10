extends Control

var started := false

func _ready() -> void:
	visible = false
	modulate.a = 0.0

func _process(_delta: float) -> void:
	if not started and Global.game_start:
		started = true
		visible = true
		var tween := create_tween()
		tween.tween_property(self, "modulate:a", 1.0, 0.3)
		tween.tween_interval(8.0)
		tween.tween_property(self, "modulate:a", 0.0, 0.3)
		tween.tween_callback(queue_free)
