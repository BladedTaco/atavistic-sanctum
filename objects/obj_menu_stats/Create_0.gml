/// @description init menu

menu_option[0] = "Default"
//get profiles
var _file = file_text_open_read("names.txt")
var o = 0;
while (!file_text_eof(_file)) {
	menu_option[o] = file_text_read_string(_file)
	file_text_readln(_file)
	o++
}
file_text_close(_file)

menu_index = 0
menu_length = array_length_1d(menu_option)
active = false
alarm[0] = MENU_DELAY
menu_surface = -1

event_user(0)