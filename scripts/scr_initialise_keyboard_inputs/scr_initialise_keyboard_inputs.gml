button_array[argument[0], 0]  = GRAB		// q			XAXIS 	
	
//keyboard
button_const_array[0]  = ord("Q")



var _file = file_text_open_read("default_keyboard_controls.txt")

var i = 0
do {
	button_const_array[i] = file_text_read_real(_file)
	file_text_readln(_file)
	button_array[argument[0], i] = file_text_read_real(_file)
	file_text_readln(_file)
	i++
} until (file_text_eof(_file))

/*

var _file = file_text_open_write(working_directory + "Default Keyboard Controls.txt")

button_array[0] = XAXIS
button_array[1] = XAXIS
button_array[2] = YAXIS
button_array[3] = YAXIS
button_array[4] = ALT_XAXIS
button_array[5] = ALT_XAXIS
button_array[6] = ALT_YAXIS
button_array[7] = ALT_YAXIS
button_array[8] = ATTACK
button_array[9] = SPECIAL
button_array[10] = JUMP
button_array[11] = PAUSE
button_array[12] = SHIELD
button_array[13] = GRAB
button_array[14] = TAUNT
button_array[15] = TILT

button_const_array[0] = ord("D")
button_const_array[1] = ord("A")
button_const_array[2] = ord("S")
button_const_array[3] = ord("W")
button_const_array[4] = ord("L")
button_const_array[5] = ord("J")
button_const_array[6] = ord("K")
button_const_array[7] = ord("I")
button_const_array[8] = ord("Q")
button_const_array[9] = ord("E")
button_const_array[10] = vk_space
button_const_array[11] = vk_escape
button_const_array[12] = vk_shift
button_const_array[13] = ord("U")
button_const_array[14] = ord("O")
button_const_array[15] = ord("F")


for (var i = 0; i <= 15; i++) {
	file_text_write_real(_file, button_const_array[i])
	file_text_writeln(_file)	
	file_text_write_real(_file, button_array[i])
	file_text_writeln(_file)	
}

file_text_close(_file)