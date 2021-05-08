extends Node2D
const ai_version = "a210507"
const ai_date = "2021-05-07"
const about = "I am an alpha "+ai_version+" version from " +ai_date+" So check please check  [url=http://diegoferraribruno.itch.io/angelica]my web page[/url] and see if there is a newer version avaible. \nIf you wanna chat a bit say: [b]hello[/b]"
const STATES = ["mini","hide","show","editor"]
var state = "show"
var state_old = "show"
const FILE_NAME = "user://game-data.json"
var ai_name = "Angelica"
var ai_color = "#ffbbdd"
var need = ""
onready var good = $DB.good
onready var bad = $DB.bad
onready var needs = $DB.needs
onready var notfeeling = $DB.notfeeling
onready var functions = $DB.functions
onready var sentences = $DB.sentences
onready var notes = $DB.notes
onready var greetings = $DB.greetings
onready var links = $DB.links
onready var ai_prefs = [ai_version, ai_name, ai_color, autohide, autoload, autosave]
onready var user = ["id", "Me", "sillyword", "#dfbdfbff", notes, links, ai_prefs]
var satisfied = 0
var text = ""
var have_feelings = []
var have_need = []
var inputs = 0
var new_face = load("res://addons/1f646.png")
var sleep = true
var history =["enter text here"]
var cdtimer
var autohide = true
var autoload = true
var autosave = true
var editing

func preload_saved():
				var file = File.new()
				if file.file_exists(FILE_NAME):
					file.open(FILE_NAME, File.READ)
					var data = parse_json(file.get_as_text())
					file.close()
					if typeof(data) == TYPE_ARRAY:
						var buser = data
						if buser[6][0] != ai_version:
							text_to_say("You might have an older version of this app: update may break things. Autosave mode is off now. Type 'LOAD' to load old prefs, list links and # to check if everything is ok. than save. if not, try 'print user' if every")
							autosave = false
						if buser[6][0] == ai_version:
							autoload = buser[6][4]
#							print(autoload)
#							if autoload == true:
							load_user_prefs()

func load_user_prefs():
				var file = File.new()
				if file.file_exists(FILE_NAME):
					file.open(FILE_NAME, File.READ)
					var data = parse_json(file.get_as_text())
					file.close()
					if typeof(data) == TYPE_ARRAY:
						user = data
						notes = user[4]
						links = user[5]
						ai_name = user[6][1]
						ai_color = user[6][2]
						autoload = user[6][4]
						autosave = user[6][5]
						autohide = user[6][3]
						
						text_to_say("OH! it is you [b][color="+user[3]+"]"+user[1]+"[/color][/b]? How are you feeling today?")
					else:
						printerr("I am sorry, Corrupted data! Reopen the app, and type 'save' to overwrite the file")
				else:
					printerr("No saved data! type 'save' to make a new file. \n Remember to aways save after making changes.")

func save_prefs():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(user))
	file.close()
	print(OS.get_user_data_dir())
func _process(delta):
	if !OS.is_window_focused() and autohide == true:
		change_state("mini")
func _teste():
	text_to_say("maravilha")
		
func _ready():
#	save_prefs() # it will reset user prefs in case of inconsistences
	preload_saved()
	face_change(new_face)
	$LineEdit.grab_focus()
	text_to_say(str("today is ", datetime_to_string(OS.get_date())+" according to this OS."+" "+about+" "+sentences["welcome"]+""))
#	if autohide == true:
#		change_state("hide")
	if OS.get_name() != "HTML5":
		get_node("Panel/Print").connect("meta_clicked", self, "_on_RichTextLabel_meta_clicked")
		
func _on_RichTextLabel_meta_clicked():
	change_state("mini")
	print ("click no link")
var panelflag

func _on_Linkmini_button_up():
#	get_node("LineEdit").visible = !get_node("LineEdit").visible
	match state:
		"mini":
			change_state(state_old)
		_:
			change_state("mini")
		
func _on_LinkHide_button_up():
	match state:
		"hide":
			change_state("show")
			get_node("LineEdit/LinkHide").text = "Show"
		"show":
			change_state("hide")
			get_node("LineEdit/LinkHide").text = "Hide"
	pass # Replace with function body.


func change_state(state_new):
	
	if state != "mini": state_old = state
	match state_new:
		"mini":
			get_node("Control/Linkmini").text = ">"
			get_node("Face").scale = Vector2(0.5,0.5)
			OS.set_window_mouse_passthrough($Polygon2Dmini.polygon)
			get_node("Panel").visible = false
			get_node("Print2").visible = false
			get_node("LineEdit").visible = false
			state = "mini"
#			get_node("LineEdit/LinkHide").text = "show"
		"hide":
			get_node("LineEdit").visible = true
			get_node("Control/Linkmini").text = "<"
			get_node("Face").scale = Vector2(1,1)
			OS.set_window_mouse_passthrough($Polygon2D.polygon)
			get_node("Panel").visible = false
			get_node("Print2").visible = true
			state = "hide"
		"show":
			get_node("LineEdit").visible = true
			get_node("Control/Linkmini").text = "<"
			get_node("Face").scale = Vector2(1,1)
			OS.set_window_mouse_passthrough([])
			get_node("Print2").visible = true
			get_node("Panel").visible = true
			get_node("Print2").visible = false
			state = "show"
func face_change(image):
	get_node("Face").set_texture(image)

func math(text) -> void:
	if text.count("+") or text.count("-") or text.count("*") or text.count("/"):
		text.replace(",",".")
		var text_to_float = "1.0*"+str(text)
		var expression = Expression.new()
		expression.parse(text_to_float)
		var result = expression.execute()
		if result != null:
			text_to_say(str(text," = ",result))

func _on_LineEdit_text_entered(new_text)-> void :
	var command = new_text.split(" ", true, 3)

	if command.size() > 1:
		var ai_name_b = ai_name.to_lower()
		match command[0].to_lower():
				ai_name_b:
					match command[1]:
						"name":
							ai_name = str(command[2])
							ai_prefs[1] = ai_name
							user[6] = ai_prefs
						"color":
							ai_color = str(command[2])
							ai_prefs[2] = ai_color
							user[6] = ai_prefs
							text_to_say("UHU! New colous! \n Did you know that i can use RGB colors like #ffddbb")
						"learn":
							text_to_say("I am not learning new sentences yet.")
				"autoload":
					if command[1] == "true":
						autoload = true
						user[6][4] = true
					if command[1] == "false":
						autoload = false
						user[6][4] = false
				"timer":
					cdtimer = float(command[1])*60
					$AngelicaTimer.wait_time = cdtimer
					$AngelicaTimer.start()
					$AngelicaTimer2.start()
					text_to_say("your timer is set! I will alert you when it is over")
					$TimerMini.start()
				"name":
					if command[1] != null:
						user[1] = command[1]
					else:
						pass
				"color":
					if command[1] != null:
						user[3] = command[1]
#						text_to_say(str("[color="+str(command[1])+"]"+str(command[1])+" is a great color![/color]"))
				"user":
					if user[1] == command[1]:
						print(user[1])
					if command[2] == user[2]:
						print("sillyword ok")
				"sillyword":
					if user[1] == command[1]:
						if user[2] == command[2]:
							print("match pass")
							user[2] = command[3]
							print("sillyword changed")
				"link":
					var key = str(command[1])
					var z = 0
					for i in links[0]:
						if i == key:
							OS.shell_open(links[1][z])
							OS.shell_open(links[1][z])
							text_to_say(str("Opening " +str(command[0] +" at "+str(links[1][z]))))
							$TimerMini.start()
						z += 1
				"google":
					var searchstring = new_text.split(" ", true)
					searchstring.remove(0)
					var search =""
					for i in searchstring:
						search += i+"+"
					OS.shell_open("https://www.google.com/search?q="+search)
	append_text(str("[color="+user[3]+"][right][b]"+user[1]+":[/b] - "+str(new_text)+"[/right][/color]\n"))
	if command.size()==1:

			math(command[0])
	if command.size() > 1:
		match command[0].to_lower():
				"edit":
					get_node("Panel/TextEdit").visible = true
					get_node("Panel/TextEdit").set_text("")
					editing = get(command[1])
					get_node("Panel/TextEdit").insert_text_at_cursor(str(editing))
					
				"print":
					text = command[1]
					text_to_say(str(get(text)))
				"calc":
					math(command[1])
				"list":
					match command[1]:
						"links":
							var x = 0
							for i in links[0]:
								text += "[url="+links[1][x]+"]"+links[0][x]+"[/url] "
								x += 1
							text_to_say(text)
							text =""
						"good": 
							list(good)
							append_text(str("\n"))
							new_face = load("res://addons/1f481.png")
							get_node("Face").set_texture(new_face)
							sleep = false
						"bad":
							new_face = load("res://addons/1f64d.png")
							get_node("Face").set_texture(new_face) 
							list(bad)
							append_text(str("\n"))
							sleep = false
						"feelings":
							new_face = load("res://addons/1f481.png")
							get_node("Face").set_texture(new_face) 
							list(good)
							append_text(str("\n"))
							list(bad)
							append_text(str("\n"))
						"#":
							var hashtags = user[4]["hashtags"]
							for i in hashtags:
								append_text(str(i+" "))
						"needs":
							new_face = load("res://addons/1f481.png")
							get_node("Face").set_texture(new_face) 
							text_to_say(str("This is a list of NEEDS that might be useful to you:"))
							list(needs)
							append_text(str("\n"))
				"run":
					$TimerMini.start()
					match command[1]:
						"app":
							OS.execute(command[2],[], false)
							text_to_say("trying to run %s" % command[2])
						"terminal":
							OS.execute("gnome-terminal",["/home/"], false)
						"gimp":
							OS.execute("gnome-terminal",["/home/"], false)
						"godot":
							OS.execute("godot3",["/home/"], false)
						"nemo":
							OS.execute("nemo",["/home/diego/Área de Trabalho"], false)
						"obs":
							OS.execute("obs",["/home/"], false)

				"remove":
					match command[1]:
							"#":
								var i = notes["hashtags"].find(str(command[1],command[2]))
								notes["hashtags"].remove(i)
								text_to_say("Hashtag #"+command[2]+" removed. Don't forget to 'save'")
							"link":
								var key = str(command[2])
								var x = 0
								for i in links[0]:
									if i == key:
										links[0].remove(x)
										links[1].remove(x)
										text_to_say("link "+i+" removed. Don't forget to 'save'")
										break
									x += 1

	if command.size() > 2:
			match command[0].to_lower():
				"add":
					match command[1]:
						"#":
							user[4]["hashtags"].append(str(command[1],command[2]))
							text = "Added hashtag:"+command[1]+command[2] + " to # list. Don't forget to 'save'"
							text_to_say(text)
						"link":
							if command.size() > 3:
								links[0].append(command[2])
								links[1].append(command[3])
								user[4]["links"] = links
								text = "Added link: "+command[2]+" to "+ command[3] + " to list. Don't forget to 'save'"
								text_to_say(text)
							text=""
	match command[0].to_lower():
			"links":
					_on_LineEdit_text_entered("list links")
			"hide":
				change_state("hide")
			"show":
				change_state("show")
			"mini":
				change_state("mini")
			"help":
				if command.size() > 1:
					if str(command[1]) in functions:
						text_to_say(str(functions[command[1]]))
#						print (functions[command[1]].size())
#							text_to_say(str(functions[command[2]]))
				else:
					new_face = load("res://addons/1f937.png")
					face_change(new_face)
					for i in functions:
						append_text(str("[b]"+i+"[/b]: "+functions[i][0]+" \n"))
						yield(get_tree().create_timer(0.35), "timeout")
			"save":
				save_prefs()
#				if command[1] == str(user[2]):
			"load":
				load_user_prefs()
			"autoload":
				autoload = !autoload
				user[6][4] = autoload
				text_to_say("autoload is "+str(autoload))
			"autosave":
				autosave = !autosave
				user[6][5] = autosave
				text_to_say("autosave is "+str(autosave))
			"user":
				text_to_say(str(user))
			"notes":
				text_to_say(str(user[4]))
			"ai_name":
				pass #user[6][1] = command[1]+" "+command[2]
			"ai_color": 
				pass #user[6][2]
			"autohide":
				autohide = !autohide
				user[6][3] = autohide
				text_to_say(("autohide is "+str(autohide)))
	history.push_front(new_text)
	new_text = " " + new_text.to_lower() + " "
	new_text = new_text.replace(",", " ");
	new_text = new_text.replace(".", " ");
	new_text = new_text.replace("!", " ");
	$LineEdit.clear()
	inputs += 1
	if new_text == " functions ":
		for i in functions:
			append_text(str(i+": "+functions[i][0]+"\n"))
	if new_text == " editor ":
#		get_node("Panel/TextEdit").text = ""
		get_node("Panel/TextEdit").visible = !get_node("Panel/TextEdit").visible
	if new_text == " bye ":
		new_face = load("res://addons/1f64b.png")
		face_change(new_face)
		if autosave == true:
			save_prefs()
			text_to_say(str("Prefences were save by autosave."))
		text_to_say(str("Bye! If you need me, reload the page or open the app again."))
		$Timer.start()
	if new_text == " clear ":
		get_node("Print2").set_bbcode("")
		get_node("Panel/Print").set_bbcode("")
		get_node("Panel/TextEdit").text = ""
	if new_text == " hashtags " or new_text == " # ":
		var clipboard = ""
		var hashtags = user[4]["hashtags"]
		for i in hashtags:
			clipboard = clipboard+" "+i
			append_text(str(i+" "))
		OS.clipboard = clipboard
		append_text("\n")
		text_to_say(str("Hashtags copied to clipboard!"))
	if new_text == " time ":
		text_to_say("it's about " + str(datetime_to_string(OS.get_time()))+" according to this OS.")
	if new_text == " date " or new_text == " today ":
		text_to_say(str("today is ", datetime_to_string(OS.get_date()))+" according to this OS.")
	if new_text == " good ":
		_on_LineEdit_text_entered("list good")
	if new_text == " bad ":
		_on_LineEdit_text_entered("list bad")
	if new_text == " sleep ":
		sleep = true
		new_face = load("res://addons/1f486.png")
		get_node("Face").set_texture(new_face)
	if new_text in greetings:
		new_face = load("res://addons/1f64b.png")
		get_node("Face").set_texture(new_face)
		text_to_say(str(greetings[new_text]))
		sleep = false
	if new_text == " new ":
		sleep = false
		get_node("Panel/Print").set_bbcode("")
		text_to_say(str(sentences["welcome"]))
		new_face = load("res://addons/1f64e.png")
		face_change(new_face)
		have_need = []
		have_feelings = []
		inputs = 0
		satisfied = 0
	if new_text == " needs ":
			new_face = load("res://addons/1f481.png")
			get_node("Face").set_texture(new_face) 
			text_to_say(str("This is a list of NEEDS that might be useful to you:"))
			list(needs)
			append_text(str("\n"))
	if !sleep:
		for i in good:
			for x in good[i]:
				x = " "+ x + " "
				if new_text.find(x) != -1:
					have_feelings.append(x)
					new_face = load("res://addons/1f646.png")
					face_change(new_face)
					satisfied += 1
					text_to_say(str("Uhu! You really look "+ i.to_lower()+ "!"))
					if !have_need:
						text_to_say(str("We might feel this way when our needs are satisfied.\n Can you name one of your needs? (if you need a list type: needs)"))
					break
		for i in notfeeling:
			for f in notfeeling[i]:
				f =  " " + f + " "
				if new_text.find(f) != -1:
					new_face = load("res://addons/1f937.png")
					face_change(new_face)
					text_to_say(str("Did you said: ", f.to_lower(), "? this is not a feeling.\n", sentences["notfeeling"]))
					break
		for i in bad:
			for y in bad[i]:
				y = " " + y + " "
				if new_text.find(y) != -1:
					have_feelings.append(y)
					new_face = load("res://addons/1f645.png")
					face_change(new_face)
					satisfied -= 1
					text_to_say(str("Oh! You are ", i.to_lower(), " aren't you?!"))
					text_to_say(str("We might feel this way when our needs are not satisfied.\nCan you identify one of your needs? (for a list of the needs, type: needs)"))
					break
		if have_feelings:
			for i in needs:
				for y in needs[i]:
					y = " " + y + " "
					if new_text.find(y) != -1:
						if satisfied <= 0:
							have_need.append(y)
							new_face = load("res://addons/1f646.png")
							get_node("Face").set_texture(new_face)
							text_to_say(str(i.to_lower(), ", hum?! I miss it too."))
							break
						if satisfied > 0:
							have_need.append(y)
							new_face = load("res://addons/1f646.png")
							get_node("Face").set_texture(new_face)
							text_to_say(str(i.to_lower(), ", hum?! That is awesome!."))
							break
						if satisfied == 0:
							have_need.append(y)
							text_to_say(str("I am sorry that I can't say: 'i know how does it feel'... \nI hope that you can find someone real to share your feelings and needs."))
							break
		text = ""
		if inputs == 5 and !have_need and !have_feelings:
			sleep == true
		if sleep == false:
			if inputs == 6 and have_need and have_feelings:
				new_face = load("res://addons/1f937.png")
				face_change(new_face)
				get_node("Face").set_texture(new_face)
				text_to_say(str("If you want to talk to someone, maybe you could tell them that you feel, ", str(have_feelings), "\n because of your need for ", str(have_need), " and than ask them to do (or stop doing) something concrete that would make your life more joyful!"))
			
			if inputs == 10:
				text_to_say(str("Remember that our freedom of choice lies in the space/time between the input and the response."))
			if inputs == 12:
				text_to_say(str("Ah, just one more thing: help the Open Source Community to improve the world!"))
			if inputs == 20:
				inputs = 0
	
func list(what) -> void:
		for i in what:
			yield(get_tree().create_timer(0.6), "timeout")
			append_text(str(" -[b] ", i, " [/b]"))
			for x in what[i]:
				yield(get_tree().create_timer(0.02), "timeout")
				append_text(str(" - ",x))
	
func text_to_say(text):
	text = str("[color="+ ai_color+"][b]"+ai_name+"[/b]: - "+text+"[/color]\n")
	get_node("Panel/Print").append_bbcode(text)
	get_node("Panel/TextEdit").insert_text_at_cursor(text)
	get_node("Print2").append_bbcode(text)
	
func append_text(text):
	get_node("Panel/Print").append_bbcode(text)
	get_node("Panel/TextEdit").insert_text_at_cursor(text)
	get_node("Print2").append_bbcode(text)
	
func _on_Timer_timeout():
		get_tree().quit()
		
func _on_SendButton_button_up():
	var new_text = get_node("LineEdit").get_text()
	_on_LineEdit_text_entered(new_text)
	
func _on_SendButton2_button_up():
	var sendtext = get_node("Panel/TextEdit").text
	get_node("Panel/Print").set_bbcode(sendtext)
#
#func _on_OpenShellWeb_pressed():
#		$AudioStreamPlayer.play()
#	OS.shell_open("https://example.com")
func _on_Print_meta_clicked(meta):
#	$AudioStreamPlayer.play()
	$TimerMini.start()
	OS.shell_open(meta)
	
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

func _on_AngelicaTimer_timeout():
	text_to_say("Atention! Timer Expired")
	new_face = load("res://addons/1f64b.png")
	get_node("Face").set_texture(new_face)
	$Warning.visible = true
	$AudioStreamPlayer.play()
	change_state("show")
	
func _on_AngelicaTimer2_timeout():
	if cdtimer > 0:
		cdtimer -= 1
		var hour: = int(cdtimer/60/60)
		var minutes = cdtimer/60
		minutes = int(fmod(minutes,60))
		var seconds := fmod(cdtimer, 60)
		$Label.text = "%02d:%02d:%02d" % [hour, minutes, seconds]
	else:
		$AngelicaTimer2.stop()
		$Label.text = ""
		

func _on_Button_button_up():
	$Warning.visible = false
func _on_TimerMini_timeout():
	change_state("mini")
func _on_Control_gui_input(InputEventMouseButton):
			match state:
				"mini":
					change_state(state_old)

func _on_LineEdit_focus_entered():
	$LineEdit.text = history[0]
	pass # Replace with function body.
var n = 0
func _on_LineEdit_gui_input(event):
	if Input.is_action_just_released("ui_up"):
		var history_max = history.size()-1
		print (n," de", history_max)
#		history.push_front($LineEdit.text)
		if n < history_max:
				if history[n] != null:
					$LineEdit.text = history[n]
					n+=1

	if Input.is_action_just_released("ui_down") and n >= 1:
			n-=1
			$LineEdit.text = history[n]
