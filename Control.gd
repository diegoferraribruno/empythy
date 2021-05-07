extends Control

var following = false
var dragging_start_position = Vector2()
var lastmouseposition = Vector2()
onready var root = get_node("..")
func _ready():
	get_tree().get_root().set_transparent_background(true)
	OS.window_per_pixel_transparency_enabled = true
	
func _on_Control_gui_input(event):
	if event is InputEventMouseButton:
		if event.get_button_index() == 1:
			following = !following
			dragging_start_position = get_local_mouse_position()

func _process(_delta):
	if following:
		if lastmouseposition != get_local_mouse_position():
			var slidewindow = Vector2()
			slidewindow = (OS.window_position + ((get_local_mouse_position()+lastmouseposition)/3-Vector2(32,32)))
			OS.set_window_position(slidewindow)
		lastmouseposition = get_local_mouse_position()

func _on_MinimizeButton_pressed():
	OS.set_window_minimized(true)

func _on_LinkButton_button_up():
	var angelica = load("res://addons/1f64b.png")
	root._on_LineEdit_text_entered("bye")
	
