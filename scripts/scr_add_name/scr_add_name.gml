///@func scr_load_name(name)
///@param player_number - the number of the player loading the name
///@param name - the profile name to load the player as
///@desc loads a player name profie into the given slot

//check if the profile exists, and if it does, open it
var _file = file_text_open_write(working_directory + "names/controls/" + argument[0] + ".txt")

with (obj_input) { //with the input handler
	//write values
	file_text_write_real(_file, c_stick_action[argument[0]]		); file_text_writeln(_file);
	file_text_write_real(_file, c_stick_deadzone[argument[0]]	); file_text_writeln(_file);		
	file_text_write_real(_file, l_stick_deadzone[argument[0]]	); file_text_writeln(_file);	
	file_text_write_real(_file, l_stick_neutral[argument[0]]	); file_text_writeln(_file);
	file_text_write_real(_file, smash[argument[0]]   			); file_text_writeln(_file);	
	file_text_write_real(_file, analogue[argument[0]]   		); file_text_writeln(_file);	
	file_text_write_real(_file, smash_deadzone[argument[0]]		); file_text_writeln(_file);	
	file_text_write_real(_file, trigger_threshold[argument[0]]	); file_text_writeln(_file);
	for (var o = 0; o < array_length_2d(button_array, argument[0]); o++) {
		file_text_write_real(_file, button_array[argument[0], o]); file_text_writeln(_file);
	}
}
file_text_close(_file) //close the file