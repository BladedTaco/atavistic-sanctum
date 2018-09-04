/// @description (debug) draw axes

if (global.debug) {  //if debug
	//set draw options
	draw_set_alpha(0.5)
	draw_set_colour(c_olive) 
	draw_circle(x, y, _maj, true) //draw major axis as a circle
	draw_circle(x, y, _min, true) //draw minor axis as a circle
	for (var i = 0; i < 4; i++) { //draw the rotated rectangle
		draw_line(_x[i], _y[i], _x[(i+1) mod 4], _y[(i+1) mod 4])
	}
	if (hitbox) { //if a hitbox
		draw_set_colour(c_orange) //set draw colour
		draw_line(x, y, x + lengthdir_x(100, a), y + lengthdir_y(100, a)) //draw knockback direction
	}
	draw_set_alpha(1) //reset draw transparency
}