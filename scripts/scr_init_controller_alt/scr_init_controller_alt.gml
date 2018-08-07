///@func scr_init_controller(player_number, name)
///@param player_number - the number of the player
///@param name - the name of the controller profile
///@desc intialises the base inputs for the given controller for the given player

with (obj_input) {
	//get the file and open it
	var _file = working_directory + "controllers/" + argument[1] + ".txt"
	if (file_exists(_file)) {
		_file = file_text_open_read(_file)
	} else {
		_file = file_text_open_read("controllers/default_controller_controls.txt")
	}

	c_stick_deadzone[argument[0]]	= file_text_read_real(_file); file_text_readln(_file);		
	l_stick_deadzone[argument[0]]	= file_text_read_real(_file); file_text_readln(_file);	
	l_stick_neutral[argument[0]]	= file_text_read_real(_file); file_text_readln(_file);
	smash[argument[0]]   			= file_text_read_real(_file); file_text_readln(_file);	
	analogue[argument[0]]   		= file_text_read_real(_file); file_text_readln(_file);	
	smash_deadzone[argument[0]]		= file_text_read_real(_file); file_text_readln(_file);	
	trigger_threshold[argument[0]]	= file_text_read_real(_file); file_text_readln(_file);
	//read button constants
	for (var i = 0; i < 20; i++) {
		button_const_array[argument[0], i] = file_text_read_real(_file);
		file_text_readln(_file);
	}
	//read axis multipliers
	for (var i = 0; i < 6; i++) {
		axis[argument[0], i] = file_text_read_real(_file);
		file_text_readln(_file);
	}

	//apply controller to player
	controller[argument[0]] = true
	controller_number[argument[0]] = argument[1]

	file_text_close(_file) //close file
}