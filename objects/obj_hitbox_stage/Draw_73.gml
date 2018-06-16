/// @description 
/// @description 
if (_min < 20) {
	draw_set_colour(c_white)
} else {
	draw_set_colour(c_aqua)
}
draw_line(_x[0], _y[0], _x[1], _y[1])
draw_line(_x[1], _y[1], _x[2], _y[2])
draw_line(_x[2], _y[2], _x[3], _y[3])
draw_line(_x[3], _y[3], _x[0], _y[0])
draw_line(_x[0], _y[0], _x[2], _y[2])
draw_line(_x[1], _y[1], _x[3], _y[3])

draw_line(_x[0], _y[0]+0.5, _x[1], _y[1]+0.5)
draw_line(_x[1], _y[1]+0.5, _x[2], _y[2]+0.5)
draw_line(_x[2], _y[2]+0.5, _x[3], _y[3]+0.5)
draw_line(_x[3], _y[3]+0.5, _x[0], _y[0]+0.5)
draw_line(_x[0], _y[0]+0.5, _x[2], _y[2]+0.5)
draw_line(_x[1], _y[1]+0.5, _x[3], _y[3]+0.5)