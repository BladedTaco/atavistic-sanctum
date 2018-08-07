///@func scr_read_name(name)
///@param name - the profile name to read
///@desc reads a profile to the menu

//check if the profile exists, and if it does, open it
var _file = file_text_open_read(working_directory + "names/controls/" + argument[0] + ".txt")

	//read values
	var _str;
	switch (file_text_read_real(_file)) { //c stick action
		case C_SMASH_ATTACK: _str = "SMASH ATTACK"; break;
		case C_TILT_ATTACK: _str = "TILT ATTACK"; break;
		case C_SPECIAL_ATTACK: _str = "SPECIAL ATTACK";	break;
		case C_GRAB: _str = "GRAB";  break;
		case C_ROLL: _str = "ROLL";  break;
		case C_TAUNT: _str = "TAUNT"; break;
		case C_NEUTRAL_ATTACK: _str = "JAB"; break;
		case C_NEUTRAL_SPECIAL: _str = "N-SPECIAL"; break;
		case -1: _str = "NOTHING"; break;
	}
	file_text_readln(_file)
	menu_option[37] = _str
	
	for (var o = 20; o < 37; o++) {
		switch (file_text_read_real(_file)) {
			case ATTACK: _str = "ATTACK"; break;
			case SPECIAL: _str = "SPECIAL";	break;
			case JUMP: _str = "JUMP"; break;
			case PAUSE: _str = "PAUSE";	break;
			case SHIELD: _str = "SHIELD"; break;
			case GRAB: _str = "GRAB"; break;
			case TAUNT: _str = "TAUNT"; break;
			case TILT: _str = "TILT"; break;
			case NOTHING: _str = "NOTHING";	break;
			case XAXIS:			
				_str = "MOVE"
				file_text_readln(_file)
			break;
		}
		menu_option[o] = _str
		file_text_readln(_file)
	}
file_text_close(_file) //close the file
