/// @description init variables
name = "NAMELESS" //name
player = -1 //active player number
player_number = 1 //total player number
active = 0 //state of activity
alarm[0] = 10
menu_option[0] = "NaMeY Mc NaMeFaCe"
menu_index = 0
menu_direction = 0
clip_surface = -1 //a surface used to make sure drawn elements dont overflow boundaries

var i = 0
//read names from file
var _file = file_text_open_read("names.txt") //open names text file
while (!file_text_eof(_file)) {	//while the file has text to read
	menu_option[i] = file_text_read_string(_file) //load names into menu
	file_text_readln(_file);
	i++
} 
file_text_close(_file)
menu_option[array_length_1d(menu_option)] = "ADD NAMES"
menu_option[array_length_1d(menu_option)] = "IN SETTINGS"
