/// @description 

if !(creator) {
if (col > 0) {
	draw_text_normal(100, 100, "COLLIDING")	
}

}

var i = 0
if (shape = CIRCLE) {
	i = 100
	draw_text_normal(100+ i, 150, string(col))
	draw_text_normal(100+ i, 300, string(x))
	draw_text_normal(100+ i, 350, string(y))
} else if 1=2 {
	draw_text_normal(100+ i, 150, string(col))
	draw_text_normal(100+ i, 200, string(x))
	draw_text_normal(100+ i, 250, string(y))
	draw_text_normal(100+ i, 300, string(_x[0]))
	draw_text_normal(100+ i, 350, string(_y[0]))
	draw_text_normal(300+ i, 300, string(_x[2]))
	draw_text_normal(300+ i, 350, string(_y[2]))
}

if (shape = CIRCLE) {
	draw_set_colour(c_white)
	draw_circle(x, y, _maj, true)
	draw_set_colour(c_yellow)
	draw_circle(x, y, _min, true)	
	draw_set_colour(c_ltgray)
	draw_line((_maj)*cos(_dir) + (_min)*sin(_dir) + x, 
				y,
				(_maj)*cos(_dir) + (_min)*sin(_dir) + x, 
				y)
	draw_line(x, 
				(_maj)*sin(_dir) - (_min)*cos(_dir) + y, 
				x,
				(_maj)*sin(_dir) - (_min)*cos(_dir) + y)
				
	draw_line(_x[0], _y[0], _x[1], _y[1])
	draw_line(_x[1], _y[1], _x[2], _y[2])
	draw_line(_x[2], _y[2], _x[3], _y[3])
	draw_line(_x[3], _y[3], _x[0], _y[0])
	
	
	
	
} else {
	draw_set_colour(c_black)
	draw_line(_x[0], _y[0], _x[1], _y[1])
	draw_line(_x[1], _y[1], _x[2], _y[2])
	draw_line(_x[2], _y[2], _x[3], _y[3])
	draw_line(_x[3], _y[3], _x[0], _y[0])
}
