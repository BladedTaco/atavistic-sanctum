/// @description 
draw_set_alpha(1)
draw_set_colour(c_white)
draw_rectangle(0, 0, 500, 500, false)
for (var i = 0; i < array_height_2d(real_placing); i++) {
	for (var o = 0; o < array_length_2d(real_placing, i); o++) {
		draw_text_normal(100 + i*50, 200 + 100*o, string(real_placing[i, o]))
	}
}
