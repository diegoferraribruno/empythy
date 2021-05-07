extends Node
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
	"PEACEFUL": ["peaceful", "calm", "clear headed", "comfortable", "centered", "content", "equanimous", "fulfilled","mellow", "quiet", "relaxed", "relieved", "satisfied", "serene", "still", "tranquil", "trusting"],
	"REFRESHED": ["refreshed", "enlivened", "rejuvenated", "renewed", "rested", "restored", "revived"]
}
var bad = {
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
	"TENSE": ["tense", "anxious", "cranky", "distressed", "distraught", "edgy", "fidgety", "frazzled", "irritable","jittery", "nervous", "overwhelmed", "restless", "stressed out"],
	"VULNERABLE": ["vulnerable", "fragile", "guarded", "helpless", "insecure", "leery", "reserved", "sensitive","shaky"],
	"YEARNING": ["yearning", "envious", "jealous", "longing", "nostalgic", "pining", "wistful"]
}

var needs = {
	"CONNECTION": ["connection", "acceptance", "affection", "appreciation", "belonging", "cooperation", "communication",
				   "closeness", "community", "companionship", "compassion", "consideration", "consistency", "empathy",
				   "inclusion", "intimacy", "love", "mutuality", "nurturing", "respect / self - respect", "safety",
				   "security", "stability", "support", "to know and be known", "to see and be seen",
				   "to understand and be understood", "trust", "warmth"],
	"PHYSICAL WELL-BEING": ["physical well-being", "air", "food", "movement", "exercise", "rest", "sleep", "sexual expression", "shelter", "touch", "water"],
	"HONESTY": ["honesty", "authenticity", "integrity", "presence"],
	"PLAY": ["play", "joy", "humor"],
	"PEACE": ["peace", "beauty", "communion", "ease", "equality", "harmony", "inspiration", "order"],
	"AUTONOMY": ["autonomy", "choice", "freedom", "independence", "space", "spontaneity"],
	"MEANING": ["meaning", "awareness", "celebration of life", "challenge", "clarity", "competence", "consciousness",
				"contribution", "creativity", "discovery", "efficacy", "effectiveness", "growth", "hope", "learning",
				"mourning", "participation", "purpose", "self-expression", "stimulation", "to matter", "understanding"
				]
}
var notfeeling = {"judgment":["used","guilt","abused","misled","abandoned","atacked","betraid","intimidated","diminuished","manipulated","rejected","pushed","provoked","unapreciated","unheard","unseem","used"]}
var greetings = {
	" hello ":"hi, how are are you?",
	" hi ":"hi, how do you feel?",
	" hello world ":"Hello world! I am so excited to exist!",
	" good night ":"good night to you too!",
	" good morning ":"Good morning, I whish you have an amazing day!",
	" i love you ":"Of course you do, we are made of love.",
	" say something ": "I wish i could give you a big hug!"
	}
var functions = {
	"help":["Say: help 'word' - And I'll tell you what that command does'"],
	"-":["------------------------- Chat commands -------------------------"],
	"hello":["Just say hello and i will start chating"," then we can talk about our feelings and needs"],
	"list feelings":["I will list words that might describe your feelings"],
	"good":["I will give you a list of good feelings"],
	"bad":["I will give you a list bad feeelings"], 
	"needs": ["a list of all the human needs that i know of:"],
	"new" : ["Reset our conversation"],
	"sleep":["I will stop talking about feelings and needs."],
	"editor":["I will open/close the internal text editor"],
	"clear":["wipe out this chatbox"],
	"hide":["will hide/show the text panel"],
	"show":["will show/hide the text panel"],
	"--":["---------------------- Operational System Commands-----------------"],
	"run":["run terminal, godot, nemo or obs, for other app try: run app app_name"],
	"time":["will display system time"],
	"timer":["say Ex.:'timer 65' and i will set an alert for 1 hour and 5 minutes"],
	"date":["I will tell you what day is today in YYYY-MM-DD format"],
	"bye":["Just say it and I will be gone!"],
	"---":["-------------------- lists, links, # notes ----------------"],
	"list":["feelings, good, bad, needs, links and #"],
#	"notes":["Show all saved notes"],
	"----":["---------------------- # Hashtag Assistant ---------------------"],
	"#":["your # will show your favorite hashtags and copy them to the clipboard"],
	"add #":["will add a word to your hashtag list: Ex: add # GodotEngine"],
	"remove #":["will remove a word from your hashtag list: EX: remove # GodotEngine"],
	"list #":["I will list of all hashtags but won't copy them"],
	"-----":["---------------------- User Commands-----------------"],
	"name":["name new_user_name"],
	"color":["ex: color red (blue, green, pink, #dfb000, #000000...)"],
	"save":["Actual lists, links, hashtags, color and username will be saved over the last profile"],
	"load":["I wiĺl load your last saved user preferences"],
	"sillyword":[" User_name old_sillyword new_sllyWorD < Just,dont!!"],
	"------":["---------------------- Web and link Commands-----------------"],
	"+":["Opens a saved link by the shortcut name: link twitter","\n to list your links type links"],
	"add link":["Add link to your list Ex.: add link youtube htpp://youtube.com"],
	"remove link:":["Ex.: remove link youtube"],
	"links":["or 'list links' will show your links"],
	"google":["google anything you want! I will open a browser with your search."],
	"-------":["---------------------Special Powers #116----------------------------"],
	"autoload":["set it to [b]true[/b] so i will know who you are or [b]false[/b] for your saved preferences to start "],
	"autosave":["auto save your preferences when you say bye"],
	"Angelica name":["change my name using 'my name' name 'new name"],
	"calc":[" 3/2 = 1.5 (of course i can count! util a few decimals at least.)"],
	"----------":["---------------I am the one -------------------------------"],
	"print":["use it with a variable name, try: print user and you will see a list of things that are going to be saved "],
	"edit":["opens a variable in editor and then you can manually set it's value..\nYou know to try stuff but be careful not to break your save file.\n Before using it. maybe set 'autosave false'"]
	}
var sentences = {
	"no_file":"Hi. Have we ever met? i am sorry, i am confused, what is your name again?",
	"welcome":"If you say just [b]bad[/b] or [b]good[/b]' i will present you some words.\n (to know what i can do, just say [b]help[/b] and don't forget to [b]load[/b] if you have saved anything)",
	"notfeeling":'It is important to choose words that really are feelings. If you use words like "abandoned" or "misled"or "unheard" we can prevent ourselves from getting to the REAL feelings. These words are more like accusations or judgments than feelings.',
	"help" :"Hi, I am afraid that all I can tell you is about a list of commands:",
		}
var notes = {"hashtags":["#GodotEngine", "#gamedev", "#indiedev", "#indie", "#indiegame", "#IndieGameDev", "#indiegames", "#gaming", "#programming", "#screenshotsaturday"]}
var links = [["twitter","google","angelica","empythy"],["http://twitter.com","https://google.com","http://diegoferraribruno.itch.io/angelica","https://github.com/diegoferraribruno/empythy"]]
var security = {"privacy":"I will save this information on a file in this computer! so its not safe!: var user = [user_id, user_name, silly_word, user_color, notes, links, ai_name, ai_color",
	"silly_word":"is not something secure! is just so we do not mistake any identity."
	}
