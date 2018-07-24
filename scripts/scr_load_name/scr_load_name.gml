///@func scr_load_name(player_number, name)
///@param player_number - the number of the player loading the name
///@param name - the profile name to load the player as
///@desc loads a player name profie into the given slot

//check if the profile exists, and if it does, open it
var _file = working_directory + "names/controls/" + argument[1] + ".txt"
if (file_exists(_file)) {
	_file = file_text_open_read(_file)	
} else {
	return -1	
}

with (obj_input) { //with the input handler
	//load values
	c_stick_action[argument[0]]   			= file_text_read_real(_file); file_text_readln(_file);
	c_stick_deadzone[argument[0]]   		= file_text_read_real(_file); file_text_readln(_file);		
	l_stick_deadzone[argument[0]]    		= file_text_read_real(_file); file_text_readln(_file);	
	l_stick_neutral[argument[0]]   			= file_text_read_real(_file); file_text_readln(_file);	
	axis[argument[0], 0]  					= file_text_read_real(_file); file_text_readln(_file);	
	axis[argument[0], 1]  					= file_text_read_real(_file); file_text_readln(_file);	
	axis[argument[0], 2]  					= file_text_read_real(_file); file_text_readln(_file);	
	axis[argument[0], 3]  					= file_text_read_real(_file); file_text_readln(_file);	
	axis[argument[0], 4]  					= file_text_read_real(_file); file_text_readln(_file);	
	axis[argument[0], 5]  					= file_text_read_real(_file); file_text_readln(_file);	
	smash[argument[0]]   					= file_text_read_real(_file); file_text_readln(_file);	
	analogue[argument[0]]   				= file_text_read_real(_file); file_text_readln(_file);	
	smash_deadzone[argument[0]]				= file_text_read_real(_file); file_text_readln(_file);	
	trigger_threshold[argument[0]]			= file_text_read_real(_file); file_text_readln(_file);
	var o = 0
	while (file_text_read_string(_file) != "CONSTANTS") { //only store button until a terminator is found
		button[argument[0], o]   			= file_text_read_real(_file); file_text_readln(_file);
		o++
	}
	file_text_readln(_file); //read past the terminator
	var o = 0
	while (!file_text_eof(_file)) { //stop storing new values when the file closes
		button_const_array[argument[0], o]	= file_text_read_real(_file); file_text_readln(_file);	
		button_array[argument[0], o]		= file_text_read_real(_file); file_text_readln(_file);
		o++
	}
}
file_text_close(_file) //close the file