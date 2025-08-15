

class LanguageEntity {
  final Map<String, String> _translationMap = {
    "belly": "tiya",//1
    "apple": "glau",//2
    "ankle": "soa",//3
    "anus": "klitut",//4
    "arm": "limmo",//5
    //"upper arm": "barasu",//7
    "armpit": "ema",//8
    "back": "kulung",//9
    "beard": "kumi",//10
    //"bladder": "pantug",//11
    "blood": "dulu",//12
    "body": "lawas",//13
    "boil":"pisso",//14
    "bone": "tulla",//15
    "brain": "ottok",//16
    "breast": "ammu",//17
    "buttocks": "tobbing",//18
    "curly hair": "kollot",//19
    //"fang":"bangkil",//20
    "one leg": "eta",//21
    "cheeck": "bayu",//22
    "chest": "koppo",//24
    "chin": "alloy",//25
    //"clavicle collar bone": "balagat",//26
    "wound ": "bokkales",//27
    //"dandruff": "kaspa",//28
    "ear": "ngillo",//29
    "elbow": "hiyu",//30
    "feces": "egong",//31
    "eye": "moto",//32
    "eyebrows": "kleweng",//33
    "fingernail": "nguob",//34
    "foot": "pao",//35
    "earwax": "tuli",//36
    "forehead": "kluttung",//37
    "face": "bayu",//38
    "gray hair": "uwwa",//39
    "armspan": "lippo",//40
    "gums": "lussuy",//41
    "hair of one's body": "bubbu",//42
    "hair of one's head": "obbuk",//43
    "hair of one's pubic area": "bongot",//44
    "hand": "limmo",//45
    "finger": "muddu neng pao",//46
    "fist": "kommong",//47
    "nail": "ungot",//48
    "gall": "poddu",//49
    "head": "ullu",//50
    "flatulence": "uttot",//51
    "fart": "uttot",//52
    "fontanelle": "blibuy",//53
    "heart": "puhung",//54
    "handspan": "dangngow",//55
    "from thumb to little finger": "dangngow",//56
    "heel": "tekod",//57
    "hip": "gkawang",//58
    "intestines": "nae",//59
    "jaw": "allow",//60
    "knee": "ulob",//61
    "lip": "kulit huung",//62
    "back of one's knee": "perro pao",//63
    "including one's foot": "mame",//64
    "liver": "otoy",//65
    //"lungs": "baga",//66
    //"milk": "hobow",//67
    "molar tooth": "baggang",//68
    "mouth": "simud",//69
    "nape of one's neck": "tuddu",//70
    "navel": "pussod",//71
    "neck": "ollong",//72
    "nose": "iddung",//73
    "palm of one's hand": "palad limmo",//74
    "penis": "uti",//75
    "phlegm": "plima",//76
    "placenta": "luna",//77
    "pus": "laña",//78
    "ribs": "luhuk",//79
    "pimple": "gyawat",//80
    "saliva": "iwo",//81
    "scar": "ólat",//82
    "scab": "kallang",//83
    "semen": "ido",//84
    "ringworm": "klakkam",//85
    "scabies": "klakkam",//86
    "shin of one's leg": "bokkong",//87
    "shoulder": "wallo",//88
    "skin": "kulit",//89
    "sole of one's foot": "palad pao",//90
    //"spine": "tulagong",
    "stomach": "tiya",//91
    "sweat": "ating",//92
    "tear": "lawwow",//93
    "tears": "lawwow",//94
    "teardrop": "lawwow",//95
    "perspiration": "ating",//96
    "testicles": "boto",//97
    "throat": "ngalo",//98
    "thumb": "muddu",//99
    "tongue": "dela",//100
    "urine": "tagge",//101
    "vagina": "tudi",//102
    "tooth": "ippo",//103
    "vein": "olát",//104
    //"voice": "koli",
    "waist": "awak",//105
    "wart": "klugu",//106
    "wound": "pali",//107
    "injury": "pali",//108
    "black": "mittom",//109
    "green": "mlunnow",//110
    "red": "mligga",//111
    "white": "putti",//112
    "yellow": "mlede",//113
    "all gone": "luppuk",//114
    "consumed": "luppuk",//115
    "correct": "bonna",//116
    "right": "bonna",//117
    "true": "bonna",//118
    "lost one's way": "bolluddus",//119
    "pass-by": "bonnulit",//120
    "threat": "banta",//121
    "need": "kailanga",//122
    "wrong": "hayup",//123
    "incorrect": "hayup",//124
    "cold": "tanno",//125
    "cough": "batuk",//126
    "fever": "kollamma",//127
    "hiccough": "huddua",//128
    "hoarse": "indi kuwang",//129
    "nightmare": "yabbanapu",//130
    "painful": "poddos",//131
    "sick": "poddos",//132
    "numb": "bottio",//133
    "full, satiated": "wossu",//134
    "gasp, pant": "mippos",//135
    "hungry": "witi",//136
    "deaf": "ingngo",//137
    "diarrhea": "kottolebes",//138
    "drunk": "iyoy",//139
    "intoxicated": "iyoy",//140
    "lame": "peo",//141
    "crippled": "peo",//142
    "sleepy": "kopita",//143
    "sick person": "kinna bogok",//144
    "thick": "kupa",//145
    "half": "tongngo",//146
    "old object": "tappe",//147
    "old person": "tuwo",//148
    "short person": "kewo",//149
    "short object": "kewo",//150
    "short time": "dagow",//151
    "small object": "pippis",//152  
    "small, as a young person": "angnga",//153
    "thin, of a person": "kolat",//154
    "thin, of an object": "nepes",//155
    "difficult": "kahirapa",//156
    "easy": "mugahu",//157
    "bright, as light": "kayang",//158
    "clean": "malinis",//159
    "clear, as water": "tiow",//160
    "deep": "lallom",//161
    "dirty": "kolipa",//162
    "dry": "tikka",////162
    "high, as a mountain": "bawwow",//163
    "low": "dalung",//164
    "narrow": "lewo",//165
    "shallow": "mopow",//166
    "sound": "bonnoos",//167
    "noise": "bonnoos",//168
    "turbid, murky": "eno",//169
    "wet": "peta",//170
    "wide": "lowa",//171
    "alcoholic drink": "blabba",//172
    "evil" : "buhaw",//173
    "insane, mentally ill": "bonggulo",//174
    "mentally ill": "bonggulo",//175
    "bald": "upow",//175
    "beautiful": "maligonnoy",//176
    "pretty": "maligonnoy",//177
    "big": "paya",//178
    "blind": "bolong",//179
    "famous": "bantuga",//177
    "fast": "hikat",//178
    "quick": "hikat",//179
    "fat": "towwo",//180
    "good": "mali",//181
    "industrious, hard-working": "messeng",//182
    "hard-working": "messeng",//182
    "know how to do something": "kottuwa",//183
    "loud": "bonnoos",//184
    "naked, bare": "nado",//185
    "noisy": "bonnoos",//186
    "poor": "koliddu",//187
    "slow": "genot",//188
    "smart": "towu",//189
    "clever, intelligent": "towu",//190
    "intelligent": "towu",//191
    "strong": "kollos",//192
    "tall, of a person": "lawe",//193
    "tired": "waloy",//194
    "weary": "waloy",//195
    "true, correct": "gele",//196
    "ugly": "homoboyo",//197
    "weak": "lomet",//198
    "wise": "towu",//199
    "quiet, silent": "topoddong",//200
    "silent": "topoddong",//201
    "broken in pieces": "babba",//202
    "broken, not working or out of order": "bossomo",//203
    "not working or out of order": "bossomo",//204
    //"cheap, inexpensive": "baratu",
    "dull, blunt": "boddu",//205
    "expensive": "maha",//206
    "costly, dear": "maha",//206
    "dear": "maha",//206
    "fat, grease": "hissib",//207
    "fragrant": "malibau",//208
    "full, to the brim": "ponnu",//209
    "to the brim": "ponnu",//209
    "heavy": "dollom",//210
    "insufficient, not enough": "labbus",//211
    "not enough": "labbus",//212
    "light": "molo",//213
    "long, elongated": "lawe",//214
    "elongated": "lawe",//214
    "loose": "lowa",//215
    "new": "lammi",//216
    "price": "paddo",//217
    "round": "tobbulug",//218
    "sharp": "tolom",//219
    "pointed": "tolom",//220
    "straight": "tullid",//221
    "tight, taut": "likkut",//222
    "taut": "likkut",//222
    "angry, anger": "muko",//223
    "anger": "muko",//223
    "ashamed": "moyoyyo",//224
    "brave, fearless": "laba",//225
    "joyful": "ligaya",//226
    "happy": "ligaya",//226
    "glad": "ligaya",//226
    "jealous": "manud",//227
    "lonely": "mlanu",//228
    "sad": "mlanu",//228
    "unhappy": "mlanu",//228
    "pity": "iddu",//229
    "proud": "poddolong",//230
    "haughty": "poddolong",//230
    "shame": "yoyyo",//231
    "shy": "moyoyyo",//232
    "stupid": "anda nonnong",//233
    "surprised": "kotokiddut",//234
    "greedy, selfish": "tingot",//235
    "lazy": "tukuk",//236
    //"cave": "langub",
    "cloud": "lawu",//237
    "cold season": "tokkapo",//238
    "cold, of weather": "kapo",//239
    "dark": "ngittong",//240
    "dew": "damu",//241
    "drizzle, light rain": "byaow",//242
    "dry season": "mollong",//243
    "soil": "bossak",//244
    "earthquake": "bilalu",//245
    "field": "nobbo",//255
    "flood": "dunnuk",//256
    "fog": "onnop",//257
    "forest, woods": "puwalas",//258
    "gold": "blawa",//259
    "high tide": "muwu keng lagat",//260
    "hot, as weather": "minit",//262
    "iron": "putow",//263
    "island": "dipa lagat",//264
    "jungle": "puwalas",//265
    "lake": "linow",//266
    "lightning": "kilat",//267
    "mist": "onnop",//268
    "monsoon wind": "onnus giddu ta lagat",//269
    "moon": "bula",//270
    "mountain": "bulud",//271
    "mud": "eno",//272
    "ocean": "be lagat",//273
    "path, trail": "dala",//274
    "plain": "be pattad",//275
    "rain": "ulá",//276
    "rainbow": "awa",//277
    "raincloud": "mayow",//278
    "rainy season": "timpu mula",//279
    "river": "beled",//280
    "riverbank": "kilid beled",//281
    "sand": "pallok",//282
    "sea": "lagat",//283
    "seaward": "horittu ta lagat",//284
    "shade": "lunga",//285
    "shore, seashore": "kilid lagat",//286
    "seashore": "kilid lagat",//286
    "sky": "langit",//287
    "spring, of water": "ollob",//288
    "star": "klammag",//289
    "steam, vapor": "hongngow",//290
    "vapor": "hongngow",//290
    "stone": "botu",//291
    "storm, typhoon": "kollos keng onnus",//292
    "typhoon": "kollos keng onnus",//292
    "stream": "belled",//293
    "summit": "huppu neng bulud",//294
    "mountain top": "huppu neng bulud",//294
    "peak": "huppu neng bulud",//294
    "sun": "oddow",//295
    "sunrise": "mappong keng oddow",//296
    "sunset": "mossok oddow",//297
    "swamp, wetland": "lati",//298
    "thunder": "litti",//299
    //"upriver, inland": "dayo",
    //"valley": "lambak",
    "volcano": "appu",
    "water": "tubig",//300
    //"waterfall": "ledok",//
    //"wave": "alon",
    "whirlpool": "blibud",//301
    "wind": "onnus",//302
    "wind from the northeast": "glaud",//303
    "wind from the south": "gayyo ngo onnus",//304
    "arrow": "bohow",//305
    "axe": "baliyung",//306
    "bait": "ponna",//307
    "barb": "kawad",//308
    "bead": "lussuk",//309
    //"boat": "bapu",
    "bow": "pana",//310
    "bridge": "titoy",//311
    "small bridge": "tamitoy",//311
    "cane": "tukkod",//312
    "canoe": "bangka",//313
    "copper": "tumbaga",//314
    "earring": "aritis",//315
    "hook": "tummanet",//316
    "necklace": "bikko",//317
    "needle": "himat",//318
    "oar, paddle": "tuduk",//319
    "outrigger": "katig",//320
    "provisions": "balu",//321
    "punt pole": "tuduk",//322
    "raft": "atad",//323
    "ring": "ihing",//324
    "rope": "tali",//325
    "saw": "gabas",//326
    "sheath": "maa",//327
    "knife": "kasidu",//327
    "shirt": "ogget",//328
    "silver": "plata",//329
    "spear": "piyassu",//330
    "stern, back of boat": "tira neng bangka",//331
    "string": "toli",//332
    "thread": "sinulid",//333
    "torch": "leha",//334
    "trousers, pants": "saluwa",//335
    "pants": "saluwa",//335
    "umbrella": "payung",//336
    "blanket": "komot",//337
    "board": "tabla",//338
    "plank of wood": "tabla",//338
    "broom": "donnak",//339
    "bubbles, foam": "bola",//340
    "clothing, clothes": "ogget",//341
    "clothes": "ogget",//341
    "coffin": "lungu",//342
    "cotton": "luddo",//343
    "door": "babong",//344
    "dust": "blubuk",//345
    "fence": "olow",//346
    "fire": "opuy",//347
    "fireplace": "tamenga",//348
    "floor, of a house": "ulud",//349
    "food": "kaa",
    "frying pan": "kala",
    "granary": "lokko",
    "hammock": "buwwa",
    "hole": "bobbo",
    "house": "boloy",
    "ice": "yelo",
    "ladder": "adda",
    //"loincloth, g-string": "saluppang",
    "mat, for sleeping": "ikkam",
    "medicine": "bawe",
    "pillow": "luna",
    "post, house pole": "tuggo",
    "rafter": "blila",
    "roof, thatch": "otop",
    "shelter": "tamilong",
    "soap": "sabon",
    //"space under a house": "dalong boloy",
    "split bamboo": "kapeng",
    "wall": "tapi",
    "window": "bobbo",
    "cockfight": "sabung",
    //"headhunting": "toppokang neng ullo",
    "language": "tokkoli",
    "money": "salapi",
    "school": "tagiskwela",
    "accustomed": "nuwwas",
    "debt": "paddo",
    "story": "nguma",
    "whistle": "nguuy",
    "yawn": "moyam",
    "ash": "ow",
    //"bamboo water container": "haka",
    "bowl": "luka",
    "breakfast": "maa lommo",
    "charcoal": "uling",
    "cooking oil": "lanno",
    "crack": "kommadde",
    "cup": "pakawan",
    "embers": "ballo",
    "ladle": "luwa",
    "mold": "lippo",
    "mortar": "lossung",
    //"oil, as cooking oil": "lanno",
    "pestle": "ollu",
    "pot for cooking": "kullo",
    "remains": "tira-tira",
    "salt": "ohi",
    "sieve": "habut",
    "smoke": "obbo",
    "soot": "ussing",
    "soup": "sabaw",
    "stew": "bollutto",
    "stove": "tamenga",
    "viand": "luddong",
    "water jar": "guhing",
    "above": "bawwow",
    "across": "gwali",
    "behind": "ta kulung",
    "below": "dalung",
    "between": "ollot",
    "center": "tongngo",
    "near": "doddong",
    "east": "gibo",
    "far": "layyu",
    "front": "tubang",
    "in front of": "tubang",
    "in the middle of": "ollot",
    "in, inside": "dallom",
    "left side": "ebang",
    "market place": "palingki",
    "on top": "bawwow",
    "outside": "lugwa",
    "place": "luga",
    "right side": "ammi",


     
    // ... (more translations)
  };

  // Add a getter to access the translation map
  Map<String, String> get translationMap => _translationMap;
   // Method to get all translations as a list of Map entries
  List<MapEntry<String, String>> get translationEntries {
    return _translationMap.entries.toList();
  }

}
