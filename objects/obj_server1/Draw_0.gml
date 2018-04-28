/// @description 
if (alarm[1] < 0) {
draw_set_halign(fa_right)
for (var i = 0; i < global.input_buffer_length; i++) {
	for (var o = 0; o < 10; o ++) {
		draw_text_normal(room_width - 10 -o*20, 50 + i*15, string(input_buffer_array[i*100, o]))
	}
}
draw_set_halign(fa_left)
}