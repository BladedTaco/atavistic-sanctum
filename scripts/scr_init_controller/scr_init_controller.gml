///@func scr_init_controller(player_number, controller_port)
///@param player_number - the number of the player
///@param controller_port - the number of the port of the controller
///@desc intialises the base inputs for the given controller for the given player

//get the file and open it
var _file = "controllers/" + gamepad_get_description(argument[1]) + ".txt"
if (file_exists(_file)) {
	_file = file_text_open_read(_file)
} else {
	_file = file_text_open_read("controllers/default_controller_controls.txt")
}

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
//read button actions
for (var i = 0; i < 20; i++) {
	button_array[argument[0], i] = file_text_read_real(_file);
	file_text_readln(_file);
}

file_text_close(_file) //close file

//apply controller to player
controller[argument[0]] = true
controller_number[argument[0]] = argument[1]