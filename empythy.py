# Empythy: Empatic (Non-violent) communication helper wrote in python by Diego Ferrari Bruno to everybody. 
# (PLEASE IMPROVE IT!)
# With word lists from:
# (c) 2005 by Center for Nonviolent Communication
# Website: www.cnvc.org Email: cnvc@cnvc.org
# Phone: +1.505-244-4041

need = ""
good = {
    "AFFECTIONATE": ["affectionate", "compassionate", "friendly", "loving", "open hearted", "sympathetic", "tender",
                     "warm"],
    "ENGAGED": ["engaged", "absorbed", "alert", "curious", "engrossed", "enchanted", "entranced", "fascinated",
                "interested", "intrigued", "involved", "spellbound", "stimulated"],
    "HOPEFUL": ["hopeful", "expectant", "encouraged", "optimistic"],
    "CONFIDENT": ["confident", "empowered", "open", "proud", "safe", "secure"],
    "EXCITED": ["excited", "amazed", "animated", "ardent", "aroused", "astonished", "dazzled", "eager", "energetic",
                "enthusiastic", "giddy", "invigorated", "lively", "passionate", "surprised", "vibrant"],
    "GRATEFUL": ["grateful", "appreciative", "moved", "thankful", "touched"],
    "INSPIRED": ["inspired", "amazed", "awed", "wonder"],
    "JOYFUL": ["joyful", "amused", "delighted", "glad", "happy", "jubilant", "pleased", "tickled"],
    "EXHILARATED": ["exhilarated", "blissful", "ecstatic", "elated", "enthralled", "exuberant", "radiant", "rapturous",
                    "thrilled"],
    "PEACEFUL": ["peaceful", "calm", "clear", "headed", "comfortable", "centered", "content", "equanimous", "fulfilled",
                 "mellow", "quiet", "relaxed", "relieved", "satisfied", "serene", "still", "tranquil", "trusting"],
    "REFRESHED": ["refreshed", "enlivened", "rejuvenated", "renewed", "rested", "restored", "revived", "Feelings",
                  "when", "your", "needs", "are"]
}
notgood = {
    "AFRAID": ["afraid", "apprehensive", "dread", "foreboding", "frightened", "mistrustful", "panicked", "petrified",
               "scared", "suspicious", "terrified", "wary", "worried"],
    "ANNOYED": ["annoyed", "aggravated", "dismayed", "disgruntled", "displeased", "exasperated", "frustrated",
                "impatient", "irritated", "irked"],
    "ANGRY": ["angry", "enraged", "furious", "incensed", "indignant", "irate", "livid", "outraged", "resentful"],
    "AVERSION": ["aversion", "animosity", "appalled", "contempt", "disgusted", "dislike", "hate", "horrified",
                 "hostile", "repulsed"],
    "CONFUSED": ["confused", "ambivalent", "baffled", "bewildered", "dazed", "hesitant", "lost", "mystified",
                 "perplexed", "puzzled", "torn"],
    "DISCONNECTED": ["disconnected", "alienated", "aloof", "apathetic", "bored", "cold", "detached", "distant",
                     "distracted", "indifferent", "numb", "removed", "uninterested", "withdrawn"],
    "DISQUIET": ["disquiet", "agitated", "alarmed", "discombobulated", "disconcerted", "disturbed", "perturbed",
                 "rattled", "restless", "shocked", "startled", "surprised", "troubled", "turbulent", "turmoil",
                 "uncomfortable", "uneasy", "unnerved", "unsettled", "upset"],
    "EMBARRASSED": ["embarrassed", "ashamed", "chagrined", "flustered", "guilty", "mortified", "self-conscious"],
    "FATIGUE": ["fatigue", "beat", "burnt out", "depleted", "exhausted", "lethargic", "listless", "sleepy", "tired",
                "weary", "worn out"],
    "PAIN": ["pain", "agony", "anguished", "bereaved", "devastated", "grief", "heartbroken", "hurt", "lonely",
             "miserable", "regretful", "remorseful"],
    "SAD": ["sad", "depressed", "dejected", "despair", "despondent", "disappointed", "discouraged", "disheartened",
            "forlorn", "gloomy", "heavy", "hearted", "hopeless", "melancholy", "unhappy", "wretched"],
    "TENSE": ["tense", "anxious", "cranky", "distressed", "distraught", "edgy", "fidgety", "frazzled", "irritable",
              "jittery", "nervous", "overwhelmed", "restless", "stressed", "out"],
    "VULNERABLE": ["vulnerable", "fragile", "guarded", "helpless", "insecure", "leery", "reserved", "sensitive",
                   "shaky"],
    "YEARNING": ["yearning", "envious", "jealous", "longing", "nostalgic", "pining", "wistful"
                 ]
}
needs = {
    "CONNECTION": ["connection", "acceptance", "affection", "appreciation", "belonging", "cooperation", "communication",
                   "closeness", "community", "companionship", "compassion", "consideration", "consistency", "empathy",
                   "inclusion", "intimacy", "love", "mutuality", "nurturing", "respect / self - respect", "safety",
                   "security", "stability", "support", "to know and be known", "to see and be seen",
                   "to understand and be understood", "trust", "warmth"],
    "PHYSICAL WELL-BEING": ["physical well-being", "air", "food", "movement", "exercise", "rest", "sleep", "sexual",
                            "expression", "safety", "shelter", "touch", "water"],
    "HONESTY": ["honesty", "authenticity", "integrity", "presence"],
    "PLAY": ["play", "joy", "humor",
             ],
    "PEACE": ["peace", "beauty", "communion", "ease", "equality", "harmony", "inspiration", "order"],
    "AUTONOMY": ["autonomy", "choice", "freedom", "independence", "space", "spontaneity"],
    "MEANING": ["meaning", "awareness", "celebration of life", "challenge", "clarity", "competence", "consciousness",
                "contribution", "creativity", "discovery", "efficacy", "effectiveness", "growth", "hope", "learning",
                "mourning", "participation", "purpose", "self-expression", "stimulation", "to matter", "understanding"
                ]
}
satisfied = 0
feeling = input(" - How are you feeling today? (if you need a list of feelings, type: list)\n")
# satisfied = input("are you feeling good y/n?")
if feeling == "list":
    for i in good:
        print(i, good[i])
    for i in notgood:
        print(i, notgood[i])
    feeling = input("so, how do you feel?")
for i in good:
    if feeling in good[i]:
        satisfied = 2
        print("Uhu! You really look", i, "!")
        need = input("We might feel this way when our needs are satisfied.\n Can you name one of your needs?"
                     "(if you need a list of the needs, type: list)\n")
        break
for i in notgood:
    if feeling in notgood[i]:
        satisfied = 1
        print("- Oh! you are feeling ", feeling, "... You are", i, "aren't you?!")
        need = input("We might feel this way when our needs are not satisfied.\nCan you identify one of your needs?"
                     "(if you need a list of the needs, type: list)\n")
        break
if need == "list":
    for b in needs:
        print(b, needs[b])
    need = input("So, what is your need?")
for i in needs:
    if need in needs[i]:
        if satisfied == 1:
            print("-", i, "HUM?! I miss it too.")
            break
        if satisfied == 2:
            print("-", i, "HUM?! That is awesome!.")
            break
        elif satisfied == 0:
            print("- I am sorry that I can't say: 'i know how does it feel'... \nI hope that you can find someone "
                  "real to share your feelings and needs. Bye.")
            print("This is a list of NEEDS that might be useful to you:")
            for b in needs:
                print(b, needs[b])
            break
        break
print(f"- If you want to talk to someone, maybe you could tell them how you are feeling {feeling} \n because you need {need} and than ask them "
      "to do (or stop doing) something concrete that would make your life more joyful!")
print("Aways: remember that our freedom of choice lies in the space/time between the input and the response.")
print("Ah.. just one more thing: there are many people in the Open Source Community \n that may count on YOUR help to improve the world!")
