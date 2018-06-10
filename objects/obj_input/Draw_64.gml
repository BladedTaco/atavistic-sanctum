/// @description 
//*
for (var i = 0; i <= global.player_number; i++) {
	for (var o = 0; o < array_length_2d(input_array, i); o++) {
		draw_text_normal(i*50 + 50, o*15 + 50, input_array[i, o])
	}
}

for (var i = 0; i < array_length_1d(button_const_array); i++) {
	draw_text_normal(200, 10 + i*15, gamepad_button_check(controller_number[0], button_const_array[i]))
	draw_text_normal(250, 10 + i*15, gamepad_button_value(controller_number[0], button_const_array[i]))
	draw_text_normal(300, 10 + i*15, gamepad_axis_value(controller_number[0], button_const_array[i]))
}

draw_set_colour(c_aqua)
for (var i = 0; i <= global.input_buffer_length; i++) {
	draw_circle(400 + i*15, 100 + 50*input_buffer_array[i*100 + 0, XAXIS], 5, false)
}
