extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	visible_characters = 0

func _process(delta):
	var total = self.get_total_character_count()
	if visible_characters < total:
		visible_characters +=7

func _on_SendButton_button_up():
	var total = self.get_total_character_count()
	visible_characters = total
	pass # Replace with function body.


func _on_LineEdit_text_entered(new_text):
	var total = self.get_total_character_count()
	visible_characters = total
