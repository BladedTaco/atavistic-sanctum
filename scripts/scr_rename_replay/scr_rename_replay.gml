///@func scr_rename_replay(old_name, new_name)
///@param old_name - the name that the replay used to have
///@param new_name - the name to give the replay
///@desc renames a replay

//get the read and write files and rename the file
var _file = "replays/" + argument[0] + ".txt"
if (file_exists(_file)) {
	file_rename(_file, "replays/" + argument[1] + ".txt")
}
_file = "replays.txt"
if (file_exists(_file)) {
	var _read_file = file_text_open_read(_file)
	var _write_file = file_text_open_write(_file)
}


//read the read file into the write file, except for the line to delete
while (!file_text_eof(_read_file)) {
	_file = file_text_read_string(_read_file) //file is used here to save memory over declaring a new variable
	file_text_readln(_read_file)
	if (_file != argument[0]) { //line fed isnt the replay to change
		file_text_write_string(_write_file, _file)
		file_text_writeln(_write_file)
	} else { //change the replay name
		file_text_write_string(_write_file, argument[1]);
		file_text_writeln(_write_file)
	}
}

//close the files
file_text_close(_read_file)
file_text_close(_write_file)