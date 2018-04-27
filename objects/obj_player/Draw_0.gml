for (var j = 0; j < array_length_1d(button_const_array)*20; j += 20) {
	if (j < 260) {
	draw_text_normal(100, j, string(j/20) + "  " + string(input_array[0, (j/20)]))
	}
	if (keyboard_check(button_const_array[(j/20)])) { 
		draw_text_outlined(200, j, c_white, c_dkgray, string(j/20) + "  " + string(button_array[0, (j/20)]))
		draw_text_outlined(300, j, c_white, c_dkgray, string(j/20) + "  " + string(button_const_array[(j/20)]))
		draw_text_outlined(400, j, c_white, c_dkgray, string(j/20) + "  " + string(chr(button_const_array[(j/20)])))
	} else {
		draw_text_normal(200, j, string(j/20) + "  " + string(button_array[0, (j/20)]))
		draw_text_normal(300, j, string(j/20) + "  " + string(button_const_array[(j/20)]))
		draw_text_normal(400, j, string(j/20) + "  " + string(chr(button_const_array[(j/20)])))
	}
}
