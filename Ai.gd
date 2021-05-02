extends Node2D
var ai_name = "Angelica"
var user = ["id","Me","dfbdfbff"]
var need = ""
onready var good = $DB.good
onready var bad = $DB.bad
onready var needs = $DB.needs
onready var notfeeling = $DB.notfeeling
onready var functions = $DB.functions
onready var sentences = $DB.sentences
onready var notes = $DB.notes
onready var greetings = $DB.greetings
var satisfied = 0
var text = ""
var havewords = []
var haveneeds = []
var inputs = 0
var angelica = load("res://addons/1f646.png")
var sleep = false
var history =[]
func _ready():
	angelica(angelica)
	$LineEdit.grab_focus()
	append_text(str("[b]"+ai_name+"[/b]: "+sentences["welcome"]+""))

func angelica(angelica):
	get_node("Face").set_texture(angelica)

func _on_LineEdit_text_entered(new_text):
	append_text(str("[color=#"+user[2]+"][right][b]"+user[1]+":[/b] - "+str(new_text)+"[/right][/color]\n"))
	history.append(new_text)
	new_text = " " + new_text.to_lower() + " "
	new_text = new_text.replace(",", " ");
	new_text = new_text.replace(".", " ");
	new_text = new_text.replace("!", " ");
	$LineEdit.clear()
	inputs += 1
	if new_text == " twitter ":
		OS.shell_open("https://twitter.com")
	if new_text == " functions ":
		for i in functions:
			append_text(str(i+": "+functions[i][0]+"\n"))
	if new_text == " edit ":
		$TextEdit.visible = !$TextEdit.visible
	if new_text == " bye ":
		angelica = load("res://addons/1f64b.png")
		angelica(angelica)
		append_text(str("[b]"+ai_name+"[/b]: - Bye! If you need me, reload the page or open the app again.\n"))
		$Timer.start()
	if new_text == " clear ":
		get_node("Print").set_bbcode("")
	if new_text == " hashtags " or new_text == " # ":
		var clipboard = ""
		for i in notes["hashtags"]:
			clipboard = clipboard+i
			append_text(str(i+" "))
		OS.clipboard = clipboard
		append_text(str("[b]"+ai_name+"[/b]: - Hashtags copied to clipboard!\n"))
	if new_text == " time ":
		var time = "[b]"+ai_name+"[/b]: it's about" + str(datetime_to_string(OS.get_time()))+" according to this OS.\n"
		append_text(time)
	if new_text == " date " or new_text == " today ":
		append_text(str("[b]"+ai_name+"[/b]: - today is", datetime_to_string(OS.get_date())))
	if new_text == " help ":
		angelica = load("res://addons/1f937.png")
		angelica(angelica)
		for i in functions:
			append_text(str("[b]"+i+"[/b]: "+functions[i][0]+" \n"))
			yield(get_tree().create_timer(0.2), "timeout")
	if new_text == " sleep ":
		sleep = true
		angelica = load("res://addons/1f486.png")
		get_node("Face").set_texture(angelica)
	if new_text in greetings:
		angelica = load("res://addons/1f64b.png")
		get_node("Face").set_texture(angelica)
		append_text(str(greetings[new_text]))
		sleep = false
	if new_text == " new ":
		get_node("Print").set_bbcode("")
		append_text(str(sentences["welcome"]))
		angelica = load("res://addons/1f64e.png")
		angelica(angelica)
		haveneeds = []
		havewords = []
		inputs = 0
		satisfied = 0
	if new_text == " feelings " or new_text == " good " or new_text == " bad ":
		append_text(str("[b]"+ai_name+"[/b]: - This is a list of [color=#0d0f0b]", new_text,"[/color] that might be useful to you:\n"))
		if new_text == " good ": 
			list(good)
			append_text(str("\n"))
			angelica = load("res://addons/1f481.png")
			get_node("Face").set_texture(angelica) 
		elif new_text == " bad ":
			angelica = load("res://addons/1f64d.png")
			get_node("Face").set_texture(angelica) 
			list(bad)
			append_text(str("\n"))
		else:
			angelica = load("res://addons/1f481.png")
			get_node("Face").set_texture(angelica) 
			list(good)
			append_text(str("\n"))
			list(bad)
			append_text(str("\n"))
	if new_text == " needs ":
			angelica = load("res://addons/1f481.png")
			get_node("Face").set_texture(angelica) 
			append_text(str("[b]"+ai_name+"[/b]: - This is a list of NEEDS that might be useful to you:\n"))
			list(needs)
			append_text(str("\n"))
	if !sleep:
		for i in good:
			for x in good[i]:
				x = " "+ x + " "
				if new_text.find(x) != -1:
					havewords.append(x)
					angelica = load("res://addons/1f646.png")
					angelica(angelica)
					satisfied += 1
					append_text(str("[b]"+ai_name+"[/b]: - Uhu! You really look "+ i.to_lower()+ "!\n"))
					append_text(str("[b]"+ai_name+"[/b]: - We might feel this way when our needs are satisfied.\n Can you name one of your needs? (if you need a list type: needs)\n"))
					break
		for i in notfeeling:
			for f in notfeeling[i]:
				f =  " " + f + " "
				if new_text.find(f) != -1:
					angelica = load("res://addons/1f937.png")
					angelica(angelica)
					append_text(str('\n- Did you said: "', f.to_lower(), '"? this is not a feeling.\n"', sentences["notfeeling"],"\n"))
					break
		for i in bad:
			for y in bad[i]:
				y = " " + y + " "
				if new_text.find(y) != -1:
					havewords.append(y)
					angelica = load("res://addons/1f645.png")
					angelica(angelica)
					satisfied -= 1
					append_text(str("[b]"+ai_name+"[/b]: - Oh! You are ", i.to_lower(), " aren't you?! \n"))
					append_text(str("[b]"+ai_name+"[/b]: - We might feel this way when our needs are not satisfied.\nCan you identify one of your needs? (for a list of the needs, type: needs)\n"))
					break
		if havewords:
			for i in needs:
				for y in needs[i]:
					y = " " + y + " "
					if new_text.find(y) != -1:
						if satisfied <= 0:
							haveneeds.append(y)
							angelica = load("res://addons/1f646.png")
							get_node("Face").set_texture(angelica)
							append_text(str("[b]"+ai_name+"[/b]: - ", i.to_lower(), ", hum?! I miss it too.\n"))
							break
						if satisfied > 0:
							haveneeds.append(y)
							angelica = load("res://addons/1f646.png")
							get_node("Face").set_texture(angelica)
							append_text(str("[b]"+ai_name+"[/b]: - ", i.to_lower(), ", hum?! That is awesome!.\n"))
							break
						if satisfied == 0:
							haveneeds.append(y)
							append_text(str("[b]"+ai_name+"[/b]: - I am sorry that I can't say: 'i know how does it feel'... \nI hope that you can find someone real to share your feelings and needs. Bye.\n"))
							break
		text = ""
		if inputs == 6 and haveneeds and havewords:
			angelica = load("res://addons/1f937.png")
			angelica(angelica)
			get_node("Face").set_texture(angelica)
			append_text(str("[b]"+ai_name+"[/b]: \n- If you want to talk to someone, maybe you could tell them that you feel, ", str(havewords), "\n because of your need for ", str(haveneeds), " and than ask them to do (or stop doing) something concrete that would make your life more joyful!\n"))
		if inputs == 8:
			append_text(str("[b]"+ai_name+"[/b]: \n- Remember that our freedom of choice lies in the space/time between the input and the response.\n"))
		if inputs == 9:
			append_text(str("[b]"+ai_name+"[/b]: \n- Ah.. just one more thing: there are many people in the Open Source Community \n that may count on YOUR help to improve the world!\n"))
			inputs = 0
			
func list(what) -> void:
		for i in what:
			yield(get_tree().create_timer(0.2), "timeout")
			append_text(str(" -[b] ", i, " [/b]"))
			for x in what[i]:
				yield(get_tree().create_timer(0.03), "timeout")
				append_text(str(" - ",x))
func append_text(text):
	get_node("Print").append_bbcode(text)
	$TextEdit.insert_text_at_cursor(text)
func _on_Timer_timeout():
		get_tree().quit()
func _on_SendButton_button_up():
	var new_text = get_node("LineEdit").get_text()
	_on_LineEdit_text_entered(new_text)
func _on_SendButton2_button_up():
	get_node("Print").set_bbcode($TextEdit.text)
func _on_OpenShellWeb_pressed():
	OS.shell_open("https://example.com")

func datetime_to_string(date):
	if (
		date.has("year")
		and date.has("month")
		and date.has("day")
		and date.has("hour")
		and date.has("minute")
		and date.has("second")
	):
		# Date and time.
		return "{year}-{month}-{day} {hour}:{minute}:{second}".format({
			year = str(date.year).pad_zeros(2),
			month = str(date.month).pad_zeros(2),
			day = str(date.day).pad_zeros(2),
			hour = str(date.hour).pad_zeros(2),
			minute = str(date.minute).pad_zeros(2),
			second = str(date.second).pad_zeros(2),
		})
	elif date.has("year") and date.has("month") and date.has("day"):
		# Date only.
		return "{year}-{month}-{day}".format({
			year = str(date.year).pad_zeros(2),
			month = str(date.month).pad_zeros(2),
			day = str(date.day).pad_zeros(2),
		})
	else:
		# Time only.
		return "{hour}:{minute}:{second}".format({
			hour = str(date.hour).pad_zeros(2),
			minute = str(date.minute).pad_zeros(2),
			second = str(date.second).pad_zeros(2),
		})
