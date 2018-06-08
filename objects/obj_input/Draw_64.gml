/// @description 
for (var i = 0; i <= global.player_number; i++) {
	for (var o = 0; o < array_length_2d(input_array, i); o++) {
		draw_text_normal(i*50 + 50, o*15 + 50, input_array[i, o])
	}
}