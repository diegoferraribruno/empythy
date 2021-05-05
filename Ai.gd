extends Node2D
var ai_name = "Angelica"
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
onready var user = ["id","Me","password","#dfbdfbff",notes,links]
var satisfied = 0
var text = ""
var havewords = []
var haveneeds = []
var inputs = 0
var angelica = load("res://addons/1f646.png")
var sleep = true
var history =[]
func _ready():
	angelica(angelica)
	$LineEdit.grab_focus()
	angelica_text(str(" "+sentences["welcome"]+""))
	if OS.get_name() != "HTML5":
		get_node("Panel/Print").connect("meta_clicked", self, "_on_RichTextLabel_meta_clicked")
const FILE_NAME = "user://game-data.json"


func angelica(angelica):
	get_node("Face").set_texture(angelica)
#func run(app):
#	OS.execute(app,["/"], false)
func _on_LineEdit_text_entered(new_text):
	append_text(str("[color="+user[3]+"][right][b]"+user[1]+":[/b] - "+str(new_text)+"[/right][/color]\n"))
	var command = new_text.split(" ", true, 3)
	if command.size() > 1:
		match command[0].to_lower():
				"list":
					match command[1]:
						"links":
							var x = 0
							for i in links[0]:
								text += "[url="+links[1][x]+"]"+links[0][x]+"[/url] "
								x += 1
							angelica_text(text)
						"good": 
							list(good)
							append_text(str("\n"))
							angelica = load("res://addons/1f481.png")
							get_node("Face").set_texture(angelica)
							sleep = false
						"bad":
							angelica = load("res://addons/1f64d.png")
							get_node("Face").set_texture(angelica) 
							list(bad)
							append_text(str("\n"))
							sleep = false
						"feelings":
							angelica = load("res://addons/1f481.png")
							get_node("Face").set_texture(angelica) 
							list(good)
							append_text(str("\n"))
							list(bad)
							append_text(str("\n"))
						"#":
							var hashtags = user[4]["hashtags"]
							for i in hashtags:
								append_text(str(i+" "))
						"needs":
							angelica = load("res://addons/1f481.png")
							get_node("Face").set_texture(angelica) 
							angelica_text(str("This is a list of NEEDS that might be useful to you:"))
							list(needs)
							append_text(str("\n"))
				"run":
					match command[1]:
						"app":
							OS.execute(command[2],["/home/"], false)
						"terminal":
							OS.execute("gnome-terminal",["/home/"], false)
						"test":
							print("test")
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
							"link":
								var key = str(command[2])
								var x = 0
								for i in links[0]:
									if i == key:
#										print (links)
										links[0].remove(x)
										links[1].remove(x)
#										print (links)
										angelica_text("link "+i+" removed. don't forget to 'save'")
										break
									x += 1
				"name":
					if command[1] != null:
						user[1] = command[1]
					else:
						pass
				"color":
					if command[1] != null:
						user[3] = command[1]
						append_text(str("[color="+str(command[1])+"]"+str(command[1])+" is a great color![/color]\n"))
				"user":
					if user[1] == command[1]:
						print(user[1])
					if command[2] == user[2]:
						print("password ok")
				"password":
					if user[1] == command[1]:
						if user[2] == command[2]:
							print("match pass")
							user[2] = command[3]
							print("password changed")
				"link":
					var key = str(command[1])
					var z = 0
					for i in links[0]:
						if i == key:
							print (links)
							OS.shell_open(links[1][z])
							angelica_text(str("Opening " +str(command[0] +" at "+str(links[1][z]))))
#							print (links)
							break
						z += 1
				"google":
					var searchstring = new_text.split(" ", true)
					searchstring.remove(0)
					var search =""
					for i in searchstring:
						search += i+"+"
					OS.shell_open("https://www.google.com/search?q="+search)
	if command.size() > 2:
		match command[0].to_lower():
			"add":
				match command[1]:
					"#":
						user[4]["hashtags"].append(str(command[1],command[2]))
					"link":
#							var key = {command[2]:command[3]}
						links[0].push_front(command[2])
						links[1].push_front(command[3])
						user[4]["links"]=links
						text = "link:"+command[1]+" to "+ command[2] + " added to list"
						angelica_text(text)



	match command[0].to_lower():
			"links":
					_on_LineEdit_text_entered("list links")
			"hide":
				if get_node("Panel").visible:
					get_node("Panel").visible = false
					OS.set_window_mouse_passthrough($Polygon2D.polygon)
					get_node("Print2").visible = true
					get_node("Control/LinkHide").text = "show"
			"show":
				if get_node("Panel").visible == false:
					get_node("Panel").visible = true
					OS.set_window_mouse_passthrough([])
					get_node("Print2").visible = false
					get_node("Control/LinkHide").text = "hide"
			"help":
				if command.size() > 1:
					if str(command[1]) in functions:
						angelica_text(str(functions[command[1]]))
#						print (functions[command[1]].size())
#							angelica_text(str(functions[command[2]]))
				else:
					angelica = load("res://addons/1f937.png")
					angelica(angelica)
					for i in functions:
						append_text(str("[b]"+i+"[/b]: "+functions[i][0]+" \n"))
						yield(get_tree().create_timer(0.35), "timeout")
			"save":
#				if command[1] == str(user[2]):
					var file = File.new()
					file.open(FILE_NAME, File.WRITE)
					file.store_string(to_json(user))
					file.close()
					
					print(notes)
			"load":
				var file = File.new()
				if file.file_exists(FILE_NAME):
					file.open(FILE_NAME, File.READ)
					var data = parse_json(file.get_as_text())
					file.close()
					if typeof(data) == TYPE_ARRAY:
						user = data
						notes = user[4]
						links = user[5]
						angelica_text("OH! it is you [b]"+user[1]+"[/b]? how are you feeling today?")
						
					else:
						printerr("I am sorry, Corrupted data! Reopen the app, and type 'save' to overwrite the file")
				else:
					printerr("No saved data! type 'save' to make a new file. \n Remember to aways save after making changes.")
#	if command[0] in links[0]:
#		OS.shell_open(links[command[0]])
#		angelica_text(str(" - Opening " +str(command[0] +" at "+str(links[command[0]])+"\n")))
				
	history.append(new_text)
	new_text = " " + new_text.to_lower() + " "
	new_text = new_text.replace(",", " ");
	new_text = new_text.replace(".", " ");
	new_text = new_text.replace("!", " ");
	$LineEdit.clear()
	inputs += 1
#	if new_text == " twitter ":
#		OS.shell_open("https://twitter.com")
	if new_text == " functions ":
		for i in functions:
			append_text(str(i+": "+functions[i][0]+"\n"))
	if new_text == " editor ":
		get_node("Panel/TextEdit").visible = !get_node("Panel/TextEdit").visible
	if new_text == " bye ":
		angelica = load("res://addons/1f64b.png")
		angelica(angelica)
		angelica_text(str("Bye! If you need me, reload the page or open the app again."))
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
		angelica_text(str("Hashtags copied to clipboard!"))
	if new_text == " time ":
		angelica_text("it's about " + str(datetime_to_string(OS.get_time()))+" according to this OS.")
	if new_text == " date " or new_text == " today ":
		angelica_text(str("today is ", datetime_to_string(OS.get_date()))+" according to this OS.")
	if new_text == " good ":
		_on_LineEdit_text_entered("list good")
	if new_text == " bad ":
		_on_LineEdit_text_entered("list bad")
	if new_text == " sleep ":
		sleep = true
		angelica = load("res://addons/1f486.png")
		get_node("Face").set_texture(angelica)
	if new_text in greetings:
		angelica = load("res://addons/1f64b.png")
		get_node("Face").set_texture(angelica)
		angelica_text(str(greetings[new_text]))
		sleep = false
	if new_text == " new ":
		sleep = false
		get_node("Panel/Print").set_bbcode("")
		angelica_text(str(sentences["welcome"]))
		angelica = load("res://addons/1f64e.png")
		angelica(angelica)
		haveneeds = []
		havewords = []
		inputs = 0
		satisfied = 0
	if new_text == " needs ":
			angelica = load("res://addons/1f481.png")
			get_node("Face").set_texture(angelica) 
			angelica_text(str("This is a list of NEEDS that might be useful to you:"))
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
					angelica_text(str("Uhu! You really look "+ i.to_lower()+ "!"))
					if !haveneeds:
						angelica_text(str("We might feel this way when our needs are satisfied.\n Can you name one of your needs? (if you need a list type: needs)"))
					break
		for i in notfeeling:
			for f in notfeeling[i]:
				f =  " " + f + " "
				if new_text.find(f) != -1:
					angelica = load("res://addons/1f937.png")
					angelica(angelica)
					angelica_text(str("Did you said: ", f.to_lower(), "? this is not a feeling.\n", sentences["notfeeling"]))
					break
		for i in bad:
			for y in bad[i]:
				y = " " + y + " "
				if new_text.find(y) != -1:
					havewords.append(y)
					angelica = load("res://addons/1f645.png")
					angelica(angelica)
					satisfied -= 1
					angelica_text(str("Oh! You are ", i.to_lower(), " aren't you?!"))
					angelica_text(str("We might feel this way when our needs are not satisfied.\nCan you identify one of your needs? (for a list of the needs, type: needs)"))
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
							angelica_text(str(i.to_lower(), ", hum?! I miss it too."))
							break
						if satisfied > 0:
							haveneeds.append(y)
							angelica = load("res://addons/1f646.png")
							get_node("Face").set_texture(angelica)
							angelica_text(str(i.to_lower(), ", hum?! That is awesome!."))
							break
						if satisfied == 0:
							haveneeds.append(y)
							angelica_text(str("I am sorry that I can't say: 'i know how does it feel'... \nI hope that you can find someone real to share your feelings and needs."))
							break
		text = ""
		if inputs == 5 and !haveneeds and !havewords:
			sleep == true
		if sleep == false:
			if inputs == 6 and haveneeds and havewords:
				angelica = load("res://addons/1f937.png")
				angelica(angelica)
				get_node("Face").set_texture(angelica)
				angelica_text(str("If you want to talk to someone, maybe you could tell them that you feel, ", str(havewords), "\n because of your need for ", str(haveneeds), " and than ask them to do (or stop doing) something concrete that would make your life more joyful!"))
			
			if inputs == 10:
				angelica_text(str("Remember that our freedom of choice lies in the space/time between the input and the response."))
			if inputs == 12:
				angelica_text(str("Ah, just one more thing: help the Open Source Community to improve the world!"))
			if inputs == 20:
				inputs = 0
			
func list(what) -> void:
		for i in what:
			yield(get_tree().create_timer(0.6), "timeout")
			append_text(str(" -[b] ", i, " [/b]"))
			for x in what[i]:
				yield(get_tree().create_timer(0.02), "timeout")
				append_text(str(" - ",x))
				
func angelica_text(text):
	text = str("[b]"+ai_name+"[/b]: - "+text+"\n")
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
	get_node("Panel/Print").set_bbcode(get_node("Panel/TextEdit").text)
#
#func _on_OpenShellWeb_pressed():
#	OS.shell_open("https://example.com")
func _on_Print_meta_clicked(meta):
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


func _on_LinkHide_button_up():
	var hidetext = get_node("Control/LinkHide").text
	_on_LineEdit_text_entered(hidetext)
	pass # Replace with function body.
