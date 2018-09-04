/// @description draw the death effect
draw_count += 3
draw_set_alpha(0.75 - (draw_count/140))
draw_circle_colour(x, y, draw_count*10, c_white, player_col, false)
if (draw_count >= 100) {
	instance_destroy();	
}