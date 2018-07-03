/// @description 

//if (debug_mode) {
	draw_set_alpha(0.5)
	draw_set_colour(c_white)
	draw_circle(x, y, _maj, true)
	draw_circle(x, y, _min, true)
	for (var i = 0; i < 4; i++) {
		draw_line(_x[i], _y[i], _x[(i+1) mod 4], _y[(i+1) mod 4])
	}
	if (hitbox) {
		draw_set_colour(c_yellow)
		draw_line(x, y, x + lengthdir_x(100, a), y + lengthdir_y(100, a))
	}
	draw_set_alpha(1)
//}