///@func scr_add_name(name, *append)
///@param name - the profile name to add
///@param *append - set to false to not add to names file, otherwise dont include it
///@desc creates the given name profile

//check if the profile exists, and if it does, open it
var _file = file_text_open_write("names/controls/" + argument[0] + ".txt")

	//write values
	var _str;
	switch (menu_option[37]) { //c stick action
		case "SMASH ATTACK": _str = C_SMASH_ATTACK; break;
		case "TILT ATTACK": _str = C_TILT_ATTACK; break;
		case "SPECIAL ATTACK": _str = C_SPECIAL_ATTACK; break;
		case "GRAB": _str = C_GRAB; break;
		case "ROLL": _str = C_ROLL; break;
		case "TAUNT": _str = C_TAUNT; break;
		case "JAB": _str = C_NEUTRAL_ATTACK; break;
		case "N-SPECIAL": _str = C_NEUTRAL_SPECIAL; break;
		case "NOTHING": _str = -1; break;
	}
	file_text_write_real(_file, _str); file_text_writeln(_file);
	for (var o = 20; o < 37; o++) {
		switch (menu_option[o]) {
			case "ATTACK": _str = ATTACK; break;
			case "SPECIAL": _str = SPECIAL; break;
			case "JUMP": _str = JUMP; break;
			case "PAUSE": _str = PAUSE; break;
			case "SHIELD": _str = SHIELD; break;
			case "GRAB": _str = GRAB; break;
			case "TAUNT": _str = TAUNT; break;
			case "TILT": _str = TILT; break;
			case "NOTHING": _str = NOTHING; break;
			case "MOVE":
				file_text_write_real(_file, XAXIS); file_text_writeln(_file);
				file_text_write_real(_file, YAXIS); file_text_writeln(_file);
				continue; //dont write _str to file below
			break;
		}
		file_text_write_real(_file, _str); file_text_writeln(_file);
	}
file_text_close(_file) //close the file

if (argument_count = 1) {
	//add the name to the index file
	_file = file_text_open_append("names.txt")
	file_text_write_string(_file, argument[0])
	file_text_writeln(_file)
	file_text_close(_file)
}