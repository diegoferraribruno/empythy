extends Control

var following = false
var dragging_start_position = Vector2()
var lastmouseposition = Vector2()
func _ready():
	get_tree().get_root().set_transparent_background(true)
	
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
	get_node("../Print").append_bbcode(str("[color=#0d0f0b][right]- Bye Bye Angelica.[/right][/color]\n"))
	get_node("../Face").set_texture(angelica)
	get_node("../Print").append_bbcode(str("- Bye! If you need me, reload the page or open the app again.\n"))
	get_node("../Timer").start()

