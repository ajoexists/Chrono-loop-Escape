extends Label

var time = 0

func _ready():
	$Timer.start()
	time = 0

func _process(delta):
	text = String(time)

func _on_Timer_timeout():
	time += 1

func reset():
	time = 0

