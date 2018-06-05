/// @description 

if (col) {
	draw_text_normal(x, 150, "COLLIDING")	
}

draw_text_normal(x, 50, col)

if (col) {
	draw_set_colour(c_white)
} else {
	draw_set_colour(c_black)	
}
draw_circle(x, y, 2, false)
