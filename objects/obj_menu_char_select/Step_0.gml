/// @description control menu
if (!active) {
	if (x < 0) {
		x += GUI_WIDTH/15
		if (x >= 0) {
			x = 0
			active = true
		}
	} else {
		x += GUI_WIDTH/15
		if (x > GUI_WIDTH) {
			instance_destroy();	
		}
	}
} else {
	for (var i = 0; i < 8; i++) { //for each menu user
		cursor_x[i] = clamp(cursor_x[i] + obj_input.input_array[i, XAXIS]*5, 0, GUI_WIDTH)
		cursor_y[i] = clamp(cursor_y[i] + obj_input.input_array[i, YAXIS]*5, 0, GUI_HEIGHT)
	}
}