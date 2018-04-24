for (var j = 0; j < 400; j += 20) {
	if (j < 260) {
	draw_text_normal(100, j, string(j/20) + "  " + string(input_array[0, (j/20)]))
	}
	draw_text_normal(200, j, string(j/20) + "  " + string(button_array[0, (j/20)]))
	draw_text_normal(300, j, string(j/20) + "  " + string(button_const_array[0, (j/20)]))
}

