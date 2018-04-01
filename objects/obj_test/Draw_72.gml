/// @description 
draw_set_colour(c_ltgray)
draw_rectangle(0, 0, room_width, room_height, false)
draw_set_colour(c_maroon)
draw_rectangle(0, y, room_width, room_height, false)
draw_set_colour(c_dkgray)
for (var i = 0; i < image_yscale; i++) {
	draw_line(0, y + i, room_width, y + i)
}