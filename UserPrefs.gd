extends Node

const FILE_NAME = "user://game-data.json"

var player = {
	"name": "Zippy",
	"score": 0,
	"level": 1,
	"high_score": {
		"value": 0,
		"date": ""
	}
}

func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(player))
	file.close()

func load():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME, File.READ)
		var data = parse_json(file.get_as_text())
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			player = data
		else:
			printerr("Corrupted data!")
	else:
		printerr("No saved data!")
