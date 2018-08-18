///@func scr_delete_replay(name)
///@param name - the name of the replay
///@desc deletes a replay

//get the read and write files and delete the file
var _file = "replays/" + argument[0] + ".txt"
if (file_exists(_file)) {
	file_delete(_file)
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
	if (_file != argument[0]) { //not the replay to remove
		file_text_write_string(_write_file, _file)
		file_text_writeln(_write_file)
	} else { //read past the replay on the read file
		repeat(4) { file_text_readln(_read_file) }
		var o = file_text_read_real(_read_file)
		repeat(3 + 6*o) { file_text_readln(_read_file) }
	}
}

//close the files
file_text_close(_read_file)
file_text_close(_write_file)