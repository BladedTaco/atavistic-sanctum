///@func scr_remove_name(type, name)
///@param type - 0 for name, 1 for controller
///@param name - the name of the name or profile to remove
///@desc removes the given name or controller

//get the read and write files and delete the file
if (argument[0] = 0) { //name
	var _file = "names/" + argument[1] + ".txt"
	if (file_exists(_file)) {
		file_delete(_file)
	}
	_file = "names.txt"
	if (file_exists(_file)) {
		var _read_file = file_text_open_read(_file)
		var _write_file = file_text_open_write(_file)
	}
} else { //controller
	var _file = "controllers/" + argument[1] + ".txt"
	if (file_exists(_file)) {
		file_delete(_file)
	}
	_file = "controllers.txt"
	if (file_exists(_file)) {
		var _read_file = file_text_open_read(_file)
		var _write_file = file_text_open_write(_file)
	}
}

//read the read file into the write file, except for the line to delete
while (!file_text_eof(_read_file)) {
	_file = file_text_read_string(_read_file) //file is used here to save memory over declaring a new variable
	file_text_readln(_read_file)
	if (_file != argument[1]) {
		file_text_write_string(_write_file, _file)
		file_text_writeln(_write_file)
	}
}

//close the files
file_text_close(_read_file)
file_text_close(_write_file)