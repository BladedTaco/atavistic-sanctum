///@func scr_initialise_keyboard_inputs(player_number)
///@param player_number - the number of the player using keyboard controls
///@desc initialises one slot to be keyboard controls, call after controller initialisation


var _file = file_text_open_read("default_keyboard_controls.txt") //open keyboad controls file

var i = 0
do {
	button_const_array[argument[0], i + 20] = file_text_read_real(_file) //read the unicode identifer
	file_text_readln(_file) //go to next line
	button_array[argument[0], i] = file_text_read_real(_file) //read the input array entry it corresponds to
	file_text_readln(_file) //go to next line
	i++ //increment i
} until (file_text_eof(_file)) //until end of file
