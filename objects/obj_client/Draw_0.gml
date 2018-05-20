/// @description 

/*

if (alarm[1] < 0) {
draw_set_halign(fa_right)
for (var i = 0; i < global.input_buffer_length; i++) {
	for (var o = 0; o < 10; o ++) {
		for (var j = 0; j < 3; j++) {
			draw_text_normal(300 + j*250 -o*20, 50 + i*15, string(obj_input.input_buffer_array[i*100 + j, o]))
		}
	}
}
draw_set_halign(fa_left)
}