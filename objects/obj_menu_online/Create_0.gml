/// @description init variables
menu_option[0] = "HOST"
menu_option[1] = "JOIN"
menu_index = 0
menu_length = 2
active = false
sub_menu = false

global.input_buffer_length = 30
for (var i = 0; i <= 31*100; i++) {
	for (var o = 0; o <= 20; o++) {
		obj_input.input_buffer_array[i, o] = 0	
	}
}