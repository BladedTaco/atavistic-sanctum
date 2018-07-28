/// @description 
menu_option[0, 0] = "NAMES" //name/profile creation and deletion
menu_option[1, 0] = "CONTROLLERS" //change default configurations for controllers
menu_option[2, 0] = "STOCKS = " + string(global.stocks) //change default match rules
menu_option[2, 1] = "TIME = " + string(global.time) //change default match rules
menu_option[3, 0] = "SOUND = " + string(global.sound) + "%"//change global sound levels
menu_option[3, 1] = "MUSIC = " + string(global.music) + "%"
if (global.debug) {
	menu_option[4, 0] = "DEBUG MODE IS\nON" //enable or disable debug and show debug overlay
} else {
	menu_option[4, 0] = "DEBUG MODE IS\nOFF" //enable or disable debug and show debug overlay
}
menu_index = 0
old_menu_index = 0
draw_count = 0
active = true
alarm[0] = MENU_DELAY*2
state = 0
sub_menu = false
creator = noone
x -= GUI_WIDTH/15

for (var i = 0; i < array_length_1d(obj_input.sticky_attack); i++) {
	obj_input.sticky_attack[i] = true
}

//set time description to be readable
if (global.time >= 60) {
	var _str = "Time = " + string(global.time div 60) + ":"
	if (global.time mod 60 < 10) {
		_str += "0"	
	}
	_str += string(global.time mod 60) + ":00"
	menu_option[2, 1] = _str
} else {
	menu_option[2, 1] =  "TIME = " + string(global.time) + ":00"
}

//set time and stocks to a special case if they are 0
if (global.stocks = 0) {
	menu_option[2, 0] = "STOCKS = INFINITE"
}
if (global.time = 0) {
	menu_option[2, 1] = "TIME = FOREVER"
}

//read names to menu
var _file = file_text_open_read("names.txt")
var i = 0
while (!file_text_eof(_file)) {
	menu_option[0, i] = file_text_read_string(_file)
	file_text_readln(_file);
	i++
}
file_text_close(_file) //close file
menu_option[0, i] = "DELETE NAME"
i++
menu_option[0, i] = "ADD NAME"

//read controllers to menu
_file = file_text_open_read("controllers.txt")
i = 0
while (!file_text_eof(_file)) {
	menu_option[1, i] = file_text_read_string(_file)
	file_text_readln(_file);
	i++
}
file_text_close(_file) //close file
menu_option[1, i] = "DELETE PROFILE"
i++
menu_option[1, i] = "ADD PROFILE"


