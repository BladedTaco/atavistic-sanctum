///@func scr_add_controller(player_number, name)
///@param player_number - the number of the player loading the name
///@param name - the profile name to load the player as
///@desc loads a player name profie into the given slot

var _file = working_directory + "controllers/" + argument[1] + ".txt" //store the name of the file
if (argument[1] != "Default") {
	if (!file_exists(_file)) { //if there isn't already a file
		//append the files name to the controller name directory
		_file = file_text_open_append("controllers.txt")
		file_text_write_string(_file, argument[1])
		file_text_writeln(_file)
		file_text_close(_file)
	}
}

//open or create the file for writing
_file = file_text_open_write(working_directory + "controllers/" + argument[1] + ".txt")

with (obj_input) { //with the input handler
	//write values
	file_text_write_real(_file, c_stick_deadzone[argument[0]]	); file_text_writeln(_file);		
	file_text_write_real(_file, l_stick_deadzone[argument[0]]	); file_text_writeln(_file);	
	file_text_write_real(_file, l_stick_neutral[argument[0]]	); file_text_writeln(_file);
	file_text_write_real(_file, smash[argument[0]]   			); file_text_writeln(_file);	
	file_text_write_real(_file, analogue[argument[0]]   		); file_text_writeln(_file);	
	file_text_write_real(_file, smash_deadzone[argument[0]]		); file_text_writeln(_file);	
	file_text_write_real(_file, trigger_threshold[argument[0]]	); file_text_writeln(_file);
	//write constants array
	for (var o = 0; o < array_length_2d(button_const_array, argument[0]); o++) {
		file_text_write_real(_file, button_const_array[argument[0], o]); file_text_writeln(_file);
	}
	//write axis multipliers
	for (var i = 0; i < 6; i++) {
		file_text_write_real(_file, axis[argument[0], i]); file_text_writeln(_file);
	}

}
file_text_close(_file) //close the file
