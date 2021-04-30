extends Node2D

var need = ""
var good = {
	"AFFECTIONATE": ["affectionate", "compassionate", "friendly", "loving", "open hearted", "sympathetic", "tender","warm"],
	"ENGAGED": ["engaged", "absorbed", "alert", "curious", "engrossed", "enchanted", "entranced", "fascinated","interested", "intrigued", "involved", "spellbound", "stimulated"],
	"HOPEFUL": ["hopeful", "expectant", "encouraged", "optimistic"],
	"CONFIDENT": ["confident", "empowered", "open", "proud", "safe", "secure"],
	"EXCITED": ["excited", "amazed", "animated", "ardent", "aroused", "astonished", "dazzled", "eager", "energetic","enthusiastic", "giddy", "invigorated", "lively", "passionate", "surprised", "vibrant"],
	"GRATEFUL": ["grateful", "appreciative", "moved", "thankful", "touched"],
	"INSPIRED": ["inspired", "amazed", "awed", "wonder"],
	"JOYFUL": ["joyful", "amused", "delighted", "glad", "happy", "jubilant", "pleased", "tickled"],
	"EXHILARATED": ["exhilarated", "blissful", "ecstatic", "elated", "enthralled", "exuberant", "radiant", "rapturous","thrilled"],
	"PEACEFUL": ["peaceful", "calm", "clear", "headed", "comfortable", "centered", "content", "equanimous", "fulfilled","mellow", "quiet", "relaxed", "relieved", "satisfied", "serene", "still", "tranquil", "trusting"],
	"REFRESHED": ["refreshed", "enlivened", "rejuvenated", "renewed", "rested", "restored", "revived"]
}
var notgood = {
	"AFRAID": ["afraid", "apprehensive", "dread", "foreboding", "frightened", "mistrustful", "panicked", "petrified","scared", "suspicious", "terrified", "wary", "worried"],
	"ANNOYED": ["annoyed", "aggravated", "dismayed", "disgruntled", "displeased", "exasperated", "frustrated","impatient", "irritated", "irked"],
	"ANGRY": ["angry", "enraged", "furious", "incensed", "indignant", "irate", "livid", "outraged", "resentful"],
	"AVERSION": ["aversion", "animosity", "appalled", "contempt", "disgusted", "dislike", "hate", "horrified", "hostile", "repulsed"],
	"CONFUSED": ["confused", "ambivalent", "baffled", "bewildered", "dazed", "hesitant", "lost", "mystified", "perplexed", "puzzled", "torn"],
	"DISCONNECTED": ["disconnected", "alienated", "aloof", "apathetic", "bored", "cold", "detached", "distant", "distracted", "indifferent", "numb", "removed", "uninterested", "withdrawn"],
	"DISQUIET": ["disquiet", "agitated", "alarmed", "discombobulated", "disconcerted", "disturbed", "perturbed", "rattled", "restless", "shocked", "startled", "surprised", "troubled", "turbulent", "turmoil", "uncomfortable", "uneasy", "unnerved", "unsettled", "upset"],
	"EMBARRASSED": ["embarrassed", "ashamed", "chagrined", "flustered", "guilty", "mortified", "self-conscious"],
	"FATIGUE": ["fatigue", "beat", "burnt out", "depleted", "exhausted", "lethargic", "listless", "sleepy", "tired","weary", "worn out"],
	"PAIN": ["pain", "agony", "anguished", "bereaved", "devastated", "grief", "heartbroken", "hurt", "lonely","miserable", "regretful", "remorseful"],
	"SAD": ["sad", "depressed", "dejected", "despair", "despondent", "disappointed", "discouraged", "disheartened","forlorn", "gloomy", "heavy", "hearted", "hopeless", "melancholy", "unhappy", "wretched"],
	"TENSE": ["tense", "anxious", "cranky", "distressed", "distraught", "edgy", "fidgety", "frazzled", "irritable","jittery", "nervous", "overwhelmed", "restless", "stressed", "out"],
	"VULNERABLE": ["vulnerable", "fragile", "guarded", "helpless", "insecure", "leery", "reserved", "sensitive","shaky"],
	"YEARNING": ["yearning", "envious", "jealous", "longing", "nostalgic", "pining", "wistful"]
}
var notfeeling = {"judgment":["used","guilt","abused","misled","abandoned","atacked","betraid","intimidated","diminuished","manipulated","rejected","pushed","provoked","unapreciated","unheard","unseem","used"]}
var sentences = {"welcome":"- How are you feeling today? (if you need a list of feelings, type: feelings)\n","notfeeling":'It is important to choose words that really are feelings. If you use words like "abandoned" or "misled"or "unheard" we can prevent ourselves from getting to the REAL feelings. These words are more like accusations or judgments than feelings.'}
var help = '-Hi, I am afraid that all that I have is a list of these commands: \n-needs : It you present you with NVC needs list \n-feelings : will present a list of words to describe your feelings" \n -new : will clear eaverything. \n -help : this is it.'

var needs = {
	"CONNECTION": ["connection", "acceptance", "affection", "appreciation", "belonging", "cooperation", "communication",
				   "closeness", "community", "companionship", "compassion", "consideration", "consistency", "empathy",
				   "inclusion", "intimacy", "love", "mutuality", "nurturing", "respect / self - respect", "safety",
				   "security", "stability", "support", "to know and be known", "to see and be seen",
				   "to understand and be understood", "trust", "warmth"],
	"PHYSICAL WELL-BEING": ["physical well-being", "air", "food", "movement", "exercise", "rest", "sleep", "sexual",
							"expression", "safety", "shelter", "touch", "water"],
	"HONESTY": ["honesty", "authenticity", "integrity", "presence"],
	"PLAY": ["play", "joy", "humor"],
	"PEACE": ["peace", "beauty", "communion", "ease", "equality", "harmony", "inspiration", "order"],
	"AUTONOMY": ["autonomy", "choice", "freedom", "independence", "space", "spontaneity"],
	"MEANING": ["meaning", "awareness", "celebration of life", "challenge", "clarity", "competence", "consciousness",
				"contribution", "creativity", "discovery", "efficacy", "effectiveness", "growth", "hope", "learning",
				"mourning", "participation", "purpose", "self-expression", "stimulation", "to matter", "understanding"
				]
}
var satisfied = 0
var text = ""
func _ready():
	$LineEdit.grab_focus()
	get_node("Print").append_bbcode(str(sentences["welcome"]))
var havewords = []
var haveneeds = []

var inputs = 0
func _on_LineEdit_text_entered(new_text):
	get_node("Print").append_bbcode(str("[color=#dfb000]- "+str(new_text)+"[/color]\n"))
	new_text = new_text.to_lower() +" "
	new_text = new_text.replace(",", " ");
	new_text = new_text.replace(".", " ");
	$LineEdit.clear()
	inputs += 1
	if new_text == "help ":
			get_node("Print").append_bbcode(str(help))
#			list(needs)
			get_node("Print").append_bbcode(str("\n"))
	if new_text == "new ":
		get_node("Print").set_bbcode("")
		haveneeds = []
		havewords = []
		inputs = 0
	if new_text == "feelings ":
		get_node("Print").append_bbcode(str("- This is a list of [color=#dfb000]feelings[/color] that might be useful to you:")+"\n")
		list(good)
		get_node("Print").append_bbcode(str("\n"))
		list(notgood)
		get_node("Print").append_bbcode(str("\n"))
	if new_text == "needs ":
			get_node("Print").append_bbcode(str("- This is a list of NEEDS that might be useful to you:")+"\n")
			list(needs)
			get_node("Print").append_bbcode(str("\n"))
#    	feeling = input("so, how do you feel?")
	for i in good:
		for x in good[i]:
			x += " "
			if new_text.find(x) != -1:
				havewords.append(x)
				satisfied += 1
				get_node("Print").append_bbcode(str("- Uhu! You really look "+ i.to_lower()+ "!"))
				get_node("Print").append_bbcode(str("\n- We might feel this way when our needs are satisfied.\n Can you name one of your needs? (if you need a list type: needs)\n"))
				break
	for i in notfeeling:
		for f in notfeeling[i]:
			f += " "
			if new_text.find(f) != -1:
				get_node("Print").append_bbcode(str('\n- Oh no! "', f.to_lower(), '" this is not a feeling.\n"', sentences["notfeeling"]))
				break
	for i in notgood:
		for y in notgood[i]:
			y += " "
			if new_text.find(y) != -1:
				havewords.append(y)
				satisfied -= 1
				get_node("Print").append_bbcode(str("\n- Oh! You are ", i.to_lower(), " aren't you?! \n"))
				get_node("Print").append_bbcode(str("\n- We might feel this way when our needs are not satisfied.\nCan you identify one of your needs? (for a list of the needs, type: needs)\n"))
				break
	if havewords:
		for i in needs:
			for y in needs[i]:
				y += " "
				if new_text.find(y) != -1:
					if satisfied <= 0:
						haveneeds.append(y)
						get_node("Print").append_bbcode(str("- ", i.to_lower(), ", hum?! I miss it too.\n"))
						break
					if satisfied > 0:
						haveneeds.append(y)
						get_node("Print").append_bbcode(str("- ", i.to_lower(), ", hum?! That is awesome!.\n"))
						break
					if satisfied == 0:
						haveneeds.append(y)
						get_node("Print").append_bbcode(str("- I am sorry that I can't say: 'i know how does it feel'... \nI hope that you can find someone real to share your feelings and needs. Bye."))
						break
	var text = ""
	if inputs > 6:
		get_node("Print").append_bbcode(str("\n- If you want to talk to someone, maybe you could tell them how you are feeling ", havewords, "\n because you need", haveneeds, " and than ask them to do (or stop doing) something concrete that would make your life more joyful!"))
		get_node("Print").append_bbcode(str("\n- Remember that our freedom of choice lies in the space/time between the input and the response."))
		get_node("Print").append_bbcode(str("\n- Ah.. just one more thing: there are many people in the Open Source Community \n that may count on YOUR help to improve the world!"))
func list(what) -> void:
		for i in what:
			get_node("Print").append_bbcode(str(what[i]))

