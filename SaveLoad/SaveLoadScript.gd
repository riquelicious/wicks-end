extends Node

var save_path = "user://wicks-end-v1.save"

func save_data(path, data):
	var file = File.new()
	file.open(path, File.WRITE)
	file.store_var(data)
	file.close()
	
func load_data(path):
	var file = File.new()
	var content
	file.open(path, File.READ)
	content = file.get_var()
	file.close()
	return content

func save_game():
	save_data(save_path, Savefile.save())


func load_game():
	 Savefile.save_data = load_data(save_path)
