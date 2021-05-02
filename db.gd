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
var functions = {
	"help":["I will give you this list of functions:"],
	"hello":["Just say hello and i will start chating"],
	"edit":["I will open (or close) the text editor"],
	"needs": ["a list of all the human needs that i know of:"],
	"feelings":["Will list words that might describe your feelings"],
	"good":["a list of good feelings"],
	"bad":["a list bad feeelings"], 
	"notes":["Show all saved notes"],
	"new" : ["reset our chat (So we can pretend we never met!)"],
	"clear":["I Will wipe out this chatbox"],
	"bye":["Just say it and I will be gone!"],
	"sleep":["I will stop talking about feelings and needs."],
	"time":["will display system time"],
	"date":["I will tell you what day is it in YYYY-MM-DD format"],
	"hashtags":["or # will show your favorite hashtags and add them to the clipboard"],
	"twiter":["opens web browser at twitter.com"]
	}
var sentences = {
	"welcome":"- Hi, how are you feeling today? \n(if you need assistance just type help)\nIf you say just 'bad' or 'good' i will present you some words.\n",
	"notfeeling":'It is important to choose words that really are feelings. If you use words like "abandoned" or "misled"or "unheard" we can prevent ourselves from getting to the REAL feelings. These words are more like accusations or judgments than feelings.\n',
	"help" :"- Hi, I am afraid that all I can tell you is about a list of commands:"
	}
var notes = {"hashtags":["#GodotEngine", "#gamedev", "#indiedev", " #indie", " #indiegame", " #IndieGameDev", " #indiegames", "#gaming", "#programming", "#screenshotsaturday\n"]}
var links = {"twitter":"http://twitter.com","google":"https://google.com"}
var greetings = {" hello ":"hi, how are are you?"," hi ":"hi, how do you feel?"," hello world ":"HeLlOOOOOOWWWW I am so excited!", " good night ":"good night to you too!"}
# Working on links...
