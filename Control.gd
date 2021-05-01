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
	if following and lastmouseposition != get_local_mouse_position():
		OS.set_window_position(OS.window_position + get_local_mouse_position()-Vector2(0,64))
	lastmouseposition = get_local_mouse_position()


func _on_MinimizeButton_pressed():
	OS.set_window_minimized(true)

func _on_LinkButton_button_up():
	get_node("../Print").append_bbcode(str("- Bye! If you need me, reload the page or open the app again.\n"))
	get_node("../Timer").start()
