extends Node

var goodemoji = {
	"AFFECTIONATE": ["res://images/1f618.png","res://images/1f61a.png"],
	"ENGAGED": ["engaged", "absorbed", "alert", "curious", "engrossed", "enchanted", "entranced", "fascinated","interested", "intrigued", "involved", "spellbound", "stimulated"],
	"HOPEFUL": ["hopeful", "expectant", "encouraged", "optimistic"],
	"CONFIDENT": ["res://images/1f60e.png", "confident", "empowered", "open", "proud", "safe", "secure"],
	"EXCITED": ["excited", "amazed", "animated", "ardent", "aroused", "astonished", "dazzled", "eager", "energetic","enthusiastic", "giddy", "invigorated", "lively", "passionate", "surprised", "vibrant"],
	"GRATEFUL": ["grateful", "appreciative", "moved", "thankful", "touched"],
	"INSPIRED": ["inspired", "amazed", "awed", "wonder"],
	"JOYFUL": ["joyful", "amused", "delighted", "glad", "happy", "jubilant", "pleased", "tickled"],
	"EXHILARATED": ["exhilarated", "blissful", "ecstatic", "elated", "enthralled", "exuberant", "radiant", "rapturous","thrilled"],
	"PEACEFUL": ["peaceful", "calm", "clear", "headed", "comfortable", "centered", "content", "equanimous", "fulfilled","mellow", "quiet", "relaxed", "relieved", "satisfied", "serene", "still", "tranquil", "trusting"],
	"REFRESHED": ["refreshed", "enlivened", "rejuvenated", "renewed", "rested", "restored", "revived"]
}
var bademoji = {
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
func _ready():
	pass # Replace with function body.
	

var emoji = {
	"grinning": {
		"unicode": "1f600",
		"shortname": ":grinning:",
		"aliases": "",
		"keywords": "grinning face happy smiley emotion"
	},
	"grin": {
		"unicode": "1f601",
		"shortname": ":grin:",
		"aliases": "",
		"keywords": "grinning face with smiling eyes happy silly smiley emotion good selfie"
	},
	"joy": {
		"unicode": "1f602",
		"shortname": ":joy:",
		"aliases": "",
		"keywords": "face with tears of joy happy silly smiley cry laugh emotion sarcastic"
	},
	"rofl": {
		"unicode": "1f923",
		"shortname": ":rofl:",
		"aliases": ":rolling_on_the_floor_laughing:",
		"keywords": "rolling on the floor laughing"
	},
	"happy": {
		"unicode": "1f603",
		"shortname": ":smiley:",
		"aliases": "",
		"keywords": "smiling face with open mouth happy smiley emotion good"
	},
	"smile": {
		"unicode": "1f604",
		"shortname": ":smile:",
		"aliases": "",
		"keywords": "smiling face with open mouth and smiling eyes happy smiley emotion"
	},
	"sweat_smile": {
		"unicode": "1f605",
		"shortname": ":sweat_smile:",
		"aliases": "",
		"keywords": "smiling face with open mouth and cold sweat smiley workout sweat emotion"
	},
	"laughing": {
		"unicode": "1f606",
		"shortname": ":laughing:",
		"aliases": ":satisfied:",
		"keywords": "smiling face with open mouth and tightly-closed eyes happy smiley laugh emotion"
	},
	"wink": {
		"unicode": "1f609",
		"shortname": ":wink:",
		"aliases": "",
		"keywords": "winking face silly smiley emotion"
	},
	"blush": {
		"unicode": "1f60a",
		"shortname": ":blush:",
		"aliases": "",
		"keywords": "smiling face with smiling eyes happy smiley emotion good beautiful"
	},
	"yum": {
		"unicode": "1f60b",
		"shortname": ":yum:",
		"aliases": "",
		"keywords": "face savouring delicious food happy silly smiley emotion sarcastic good"
	},
	"sunglasses": {
		"unicode": "1f60e",
		"shortname": ":sunglasses:",
		"aliases": "",
		"keywords": "smiling face with sunglasses silly smiley emojione glasses boys night"
	},
	"heart_eyes": {
		"unicode": "1f60d",
		"shortname": ":heart_eyes:",
		"aliases": "",
		"keywords": "smiling face with heart-shaped eyes happy smiley love sex heart eyes emotion beautiful"
	},
	"kissing_heart": {
		"unicode": "1f618",
		"shortname": ":kissing_heart:",
		"aliases": "",
		"keywords": "face throwing a kiss smiley love sexy"
	},
	"kissing": {
		"unicode": "1f617",
		"shortname": ":kissing:",
		"aliases": "",
		"keywords": "kissing face smiley sexy"
	},
	"kissing_smiling_eyes": {
		"unicode": "1f619",
		"shortname": ":kissing_smiling_eyes:",
		"aliases": "",
		"keywords": "kissing face with smiling eyes smiley sexy"
	},
	"kissing_closed_eyes": {
		"unicode": "1f61a",
		"shortname": ":kissing_closed_eyes:",
		"aliases": "",
		"keywords": "kissing face with closed eyes smiley sexy"
	},
	"relaxed": {
		"unicode": "263a",
		"shortname": ":relaxed:",
		"aliases": "",
		"keywords": "white smiling face happy smiley"
	},
	"slight_smile": {
		"unicode": "1f642",
		"shortname": ":slight_smile:",
		"aliases": ":slightly_smiling_face:",
		"keywords": "slightly smiling face happy smiley"
	},
	"hugging": {
		"unicode": "1f917",
		"shortname": ":hugging:",
		"aliases": ":hugging_face:",
		"keywords": "hugging face smiley hug thank you"
	},
	"thinking": {
		"unicode": "1f914",
		"shortname": ":thinking:",
		"aliases": ":thinking_face:",
		"keywords": "thinking face smiley thinking boys night"
	},
	"neutral_face": {
		"unicode": "1f610",
		"shortname": ":neutral_face:",
		"aliases": "",
		"keywords": "neutral face mad smiley shrug neutral emotion"
	},
	"expressionless": {
		"unicode": "1f611",
		"shortname": ":expressionless:",
		"aliases": "",
		"keywords": "expressionless face mad smiley neutral emotion"
	},
	"no_mouth": {
		"unicode": "1f636",
		"shortname": ":no_mouth:",
		"aliases": "",
		"keywords": "face without mouth mad smiley neutral emotion"
	},
	"rolling_eyes": {
		"unicode": "1f644",
		"shortname": ":rolling_eyes:",
		"aliases": ":face_with_rolling_eyes:",
		"keywords": "face with rolling eyes mad smiley rolling eyes emotion sarcastic"
	},
	"smirk": {
		"unicode": "1f60f",
		"shortname": ":smirk:",
		"aliases": "",
		"keywords": "smirking face silly smiley sexy sarcastic"
	},
	"persevere": {
		"unicode": "1f623",
		"shortname": ":persevere:",
		"aliases": "",
		"keywords": "persevering face sad smiley angry emotion"
	},
	"disappointed_relieved": {
		"unicode": "1f625",
		"shortname": ":disappointed_relieved:",
		"aliases": "",
		"keywords": "disappointed but relieved face sad smiley stressed sweat cry emotion"
	},
	"open_mouth": {
		"unicode": "1f62e",
		"shortname": ":open_mouth:",
		"aliases": "",
		"keywords": "face with open mouth smiley surprised wow emotion"
	},
	"zipper_mouth": {
		"unicode": "1f910",
		"shortname": ":zipper_mouth:",
		"aliases": ":zipper_mouth_face:",
		"keywords": "zipper-mouth face mad smiley"
	},
	"hushed": {
		"unicode": "1f62f",
		"shortname": ":hushed:",
		"aliases": "",
		"keywords": "hushed face smiley surprised wow"
	},
	"sleepy": {
		"unicode": "1f62a",
		"shortname": ":sleepy:",
		"aliases": "",
		"keywords": "sleepy face smiley sick emotion"
	},
	"tired_face": {
		"unicode": "1f62b",
		"shortname": ":tired_face:",
		"aliases": "",
		"keywords": "tired face sad smiley tired emotion"
	},
	"sleeping": {
		"unicode": "1f634",
		"shortname": ":sleeping:",
		"aliases": "",
		"keywords": "sleeping face smiley tired emotion goodnight"
	},
	"relieved": {
		"unicode": "1f60c",
		"shortname": ":relieved:",
		"aliases": "",
		"keywords": "relieved face smiley emotion"
	},
	"nerd": {
		"unicode": "1f913",
		"shortname": ":nerd:",
		"aliases": ":nerd_face:",
		"keywords": "nerd face smiley glasses"
	},
	"stuck_out_tongue": {
		"unicode": "1f61b",
		"shortname": ":stuck_out_tongue:",
		"aliases": "",
		"keywords": "face with stuck-out tongue smiley sex emotion"
	},
	"stuck_out_tongue_winking_eye": {
		"unicode": "1f61c",
		"shortname": ":stuck_out_tongue_winking_eye:",
		"aliases": "",
		"keywords": "face with stuck-out tongue and winking eye happy smiley emotion parties"
	},
	"stuck_out_tongue_closed_eyes": {
		"unicode": "1f61d",
		"shortname": ":stuck_out_tongue_closed_eyes:",
		"aliases": "",
		"keywords": "face with stuck-out tongue and tightly-closed eyes happy smiley emotion"
	},
	"drooling_face": {
		"unicode": "1f924",
		"shortname": ":drooling_face:",
		"aliases": ":drool:",
		"keywords": "drooling face"
	},
	"unamused": {
		"unicode": "1f612",
		"shortname": ":unamused:",
		"aliases": "",
		"keywords": "unamused face sad mad smiley tired emotion"
	},
	"sweat": {
		"unicode": "1f613",
		"shortname": ":sweat:",
		"aliases": "",
		"keywords": "face with cold sweat sad smiley stressed sweat emotion"
	},
	"pensive": {
		"unicode": "1f614",
		"shortname": ":pensive:",
		"aliases": "",
		"keywords": "pensive face sad smiley emotion rip"
	},
	"confused": {
		"unicode": "1f615",
		"shortname": ":confused:",
		"aliases": "",
		"keywords": "confused face smiley surprised emotion"
	},
	"upside_down": {
		"unicode": "1f643",
		"shortname": ":upside_down:",
		"aliases": ":upside_down_face:",
		"keywords": "upside-down face silly smiley sarcastic"
	},
	"money_mouth": {
		"unicode": "1f911",
		"shortname": ":money_mouth:",
		"aliases": ":money_mouth_face:",
		"keywords": "money-mouth face smiley win money emotion boys night"
	},
	"astonished": {
		"unicode": "1f632",
		"shortname": ":astonished:",
		"aliases": "",
		"keywords": "astonished face smiley surprised wow emotion omg"
	},
	"frowning2": {
		"unicode": "2639",
		"shortname": ":frowning2:",
		"aliases": ":white_frowning_face:",
		"keywords": "white frowning face sad smiley emotion"
	},
	"slight_frown": {
		"unicode": "1f641",
		"shortname": ":slight_frown:",
		"aliases": ":slightly_frowning_face:",
		"keywords": "slightly frowning face sad smiley emotion"
	},
	"confounded": {
		"unicode": "1f616",
		"shortname": ":confounded:",
		"aliases": "",
		"keywords": "confounded face sad smiley angry emotion"
	},
	"disappointed": {
		"unicode": "1f61e",
		"shortname": ":disappointed:",
		"aliases": "",
		"keywords": "disappointed face sad smiley tired emotion"
	},
	"worried": {
		"unicode": "1f61f",
		"shortname": ":worried:",
		"aliases": "",
		"keywords": "worried face sad smiley emotion"
	},
	"triumph": {
		"unicode": "1f624",
		"shortname": ":triumph:",
		"aliases": "",
		"keywords": "face with look of triumph mad smiley angry emotion steam"
	},
	"cry": {
		"unicode": "1f622",
		"shortname": ":cry:",
		"aliases": "",
		"keywords": "crying face sad smiley cry emotion rip heartbreak"
	},
	"sob": {
		"unicode": "1f62d",
		"shortname": ":sob:",
		"aliases": "",
		"keywords": "loudly crying face sad smiley cry emotion heartbreak"
	},
	"frowning": {
		"unicode": "1f626",
		"shortname": ":frowning:",
		"aliases": "",
		"keywords": "frowning face with open mouth sad smiley surprised emotion"
	},
	"anguished": {
		"unicode": "1f627",
		"shortname": ":anguished:",
		"aliases": "",
		"keywords": "anguished face sad smiley surprised emotion"
	},
	"fearful": {
		"unicode": "1f628",
		"shortname": ":fearful:",
		"aliases": "",
		"keywords": "fearful face smiley surprised emotion"
	},
	"weary": {
		"unicode": "1f629",
		"shortname": ":weary:",
		"aliases": "",
		"keywords": "weary face sad smiley tired stressed emotion"
	},
	"grimacing": {
		"unicode": "1f62c",
		"shortname": ":grimacing:",
		"aliases": "",
		"keywords": "grimacing face silly smiley emotion selfie"
	},
	"cold_sweat": {
		"unicode": "1f630",
		"shortname": ":cold_sweat:",
		"aliases": "",
		"keywords": "face with open mouth and cold sweat smiley sweat emotion"
	},
	"scream": {
		"unicode": "1f631",
		"shortname": ":scream:",
		"aliases": "",
		"keywords": "face screaming in fear smiley surprised wow emotion omg"
	},
	"flushed": {
		"unicode": "1f633",
		"shortname": ":flushed:",
		"aliases": "",
		"keywords": "flushed face smiley emotion omg"
	},
	"dizzy": {
		"unicode": "1f635",
		"shortname": ":dizzy_face:",
		"aliases": "",
		"keywords": "dizzy face smiley surprised dead wow emotion omg"
	},
	"rage": {
		"unicode": "1f621",
		"shortname": ":rage:",
		"aliases": "",
		"keywords": "pouting face mad smiley angry emotion"
	},
	"angry": {
		"unicode": "1f620",
		"shortname": ":angry:",
		"aliases": "",
		"keywords": "angry face mad smiley emotion"
	},
	"innocent": {
		"unicode": "1f607",
		"shortname": ":innocent:",
		"aliases": "",
		"keywords": "smiling face with halo smiley emotion"
	},
	"cowboy": {
		"unicode": "1f920",
		"shortname": ":cowboy:",
		"aliases": ":face_with_cowboy_hat:",
		"keywords": "face with cowboy hat"
	},
	"clown": {
		"unicode": "1f921",
		"shortname": ":clown:",
		"aliases": ":clown_face:",
		"keywords": "clown face"
	},
	"lying_face": {
		"unicode": "1f925",
		"shortname": ":lying_face:",
		"aliases": ":liar:",
		"keywords": "lying face"
	},
	"mask": {
		"unicode": "1f637",
		"shortname": ":mask:",
		"aliases": "",
		"keywords": "face with medical mask smiley dead health sick"
	},
	"thermometer_face": {
		"unicode": "1f912",
		"shortname": ":thermometer_face:",
		"aliases": ":face_with_thermometer:",
		"keywords": "face with thermometer smiley health sick emotion"
	},
	"head_bandage": {
		"unicode": "1f915",
		"shortname": ":head_bandage:",
		"aliases": ":face_with_head_bandage:",
		"keywords": "face with head-bandage smiley health sick emotion"
	},
	"nauseated_face": {
		"unicode": "1f922",
		"shortname": ":nauseated_face:",
		"aliases": ":sick:",
		"keywords": "nauseated face"
	},
	"sneezing_face": {
		"unicode": "1f927",
		"shortname": ":sneezing_face:",
		"aliases": ":sneeze:",
		"keywords": "sneezing face"
	},
	"smiling_imp": {
		"unicode": "1f608",
		"shortname": ":smiling_imp:",
		"aliases": "",
		"keywords": "smiling face with horns silly smiley angry monster devil boys night"
	},
	"imp": {
		"unicode": "1f47f",
		"shortname": ":imp:",
		"aliases": "",
		"keywords": "imp smiley monster devil wth"
	},
	"japanese_ogre": {
		"unicode": "1f479",
		"shortname": ":japanese_ogre:",
		"aliases": "",
		"keywords": "japanese ogre monster"
	},
	"japanese_goblin": {
		"unicode": "1f47a",
		"shortname": ":japanese_goblin:",
		"aliases": "",
		"keywords": "japanese goblin angry monster"
	},
	"skull": {
		"unicode": "1f480",
		"shortname": ":skull:",
		"aliases": ":skeleton:",
		"keywords": "skull dead halloween skull"
	},
	"skull_crossbones": {
		"unicode": "2620",
		"shortname": ":skull_crossbones:",
		"aliases": ":skull_and_crossbones:",
		"keywords": "skull and crossbones symbol dead skull"
	},
	"ghost": {
		"unicode": "1f47b",
		"shortname": ":ghost:",
		"aliases": "",
		"keywords": "ghost holidays halloween monster"
	},
	"alien": {
		"unicode": "1f47d",
		"shortname": ":alien:",
		"aliases": "",
		"keywords": "extraterrestrial alien space monster alien scientology"
	},
}
func facechange(smiley) -> void:
	for i in emoji:
		if i+" " == smiley:
			print(emoji[i]["unicode"])
			var bullet_tex3 = load("res://images/"+(emoji[i]["unicode"])+".png")
			get_node("Face").set_texture(bullet_tex3)
			break



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
