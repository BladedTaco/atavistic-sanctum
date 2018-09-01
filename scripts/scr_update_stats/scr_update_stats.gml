///@func scr_update_stats()
///@desc - run at the end of the match in obj_results to update player stats

var _file, _array, o;
for (var i = 0; i < array_length_1d(name); i++) {
	if (file_exists("names/stats/" + name[i] + ".txt")) { //if there is a file
		//initialise array in case this is a profile from a previous game version
		for (o = 0; o < CHARACTER_NUMBER*2; o++) {
			_array[o] = 0
		}
		//read out current values into an array
		_file = file_text_open_read("names/stats/" + name[i] + ".txt")
		o = 0
		while (!file_text_eof(_file)) {
			_array[o] = file_text_read_real(_file)
			file_text_readln(_file)
			o++
		}
		file_text_close(_file) //close the file
		//add the new values
		_array[character[i]*2] += 1 //add an instance of play with this character
		if (real_placing[i, 2] = 1) { //if this is the winner
			_array[character[i]*2 + 1] += 1 //add an instance of a win with this character
		}
		//write the sum of the new and old values into the file
		_file = file_text_open_write("names/stats/" + name[i] + ".txt")
		for (var o = 0; o < array_length_1d(_array); o++) {
			file_text_write_real(_file, _array[o]); 
			file_text_writeln(_file);	
		}
		file_text_close(_file)
	}
}