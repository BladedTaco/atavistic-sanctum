///@func scr_cir_col_cir_iterate(xx, yy, c0x, c0y, c2x, c2y, rr) 
///@param xx - polygon edge x
///@param yy - polygon edge y
///@param c0x - circle 0 x
///@param c0y - circle 0 y
///@param c2x - circle 2 x
///@param c2y - circle 2 y
///@param rr - radius
///@desc splits given shapes into 2^n+2 edged polygons and iteratively checks for collision
//this is a function translated from C++ code, as such it breaks many conventions used throughout the program
var xx = argument[0]
var yy = argument[1]
var c0x = argument[2]
var c0y = argument[3]
var c2x = argument[4]
var c2y = argument[5]
var rr = argument[6]
for (var t = 1; t <= global.maxIterations; t++) {
	var c1x = (c0x + c2x)*global.innerPolygonCoef[t];
	var c1y = (c0y + c2y)*global.innerPolygonCoef[t];
	var tx = xx - c1x;
	var ty = yy - c1y;
	if (tx*tx + ty*ty <= rr) {
		return true;
	}
	var t2x = c2x - c1x;
	var t2y = c2y - c1y;
	if (tx*t2x + ty*t2y >= 0 && tx*t2x + ty*t2y <= t2x*t2x + t2y*t2y &&
	(ty*t2x - tx*t2y >= 0 || rr*(t2x*t2x + t2y*t2y) >= (ty*t2x - tx*t2y)*(ty*t2x - tx*t2y))) {
		return true;
	}
	var t0x = c0x - c1x;
	var t0y = c0y - c1y;
	if (tx*t0x + ty*t0y >= 0 && tx*t0x + ty*t0y <= t0x*t0x + t0y*t0y &&
	(ty*t0x - tx*t0y <= 0 || rr*(t0x*t0x + t0y*t0y) >= (ty*t0x - tx*t0y)*(ty*t0x - tx*t0y))) {
		return true;
	}    
	var c3x = (c0x + c1x)*global.outerPolygonCoef[t];
	var c3y = (c0y + c1y)*global.outerPolygonCoef[t];
	if ((c3x-xx)*(c3x-xx) + (c3y-yy)*(c3y-yy) < rr) {
		c2x = c1x;
		c2y = c1y;
		continue;
	}
	var c4x = c1x - c3x + c1x;
	var c4y = c1y - c3y + c1y;
	if ((c4x-xx)*(c4x-xx) + (c4y-yy)*(c4y-yy) < rr) {
		c0x = c1x;
		c0y = c1y;
		continue;
	}
	var t3x = c3x - c1x;
	var t3y = c3y - c1y;
	if (ty*t3x - tx*t3y <= 0 || rr*(t3x*t3x + t3y*t3y) > (ty*t3x - tx*t3y)*(ty*t3x - tx*t3y)) {
		if (tx*t3x + ty*t3y > 0) {
			if (abs(tx*t3x + ty*t3y) <= t3x*t3x + t3y*t3y || (xx-c3x)*(c0x-c3x) + (yy-c3y)*(c0y-c3y) >= 0) {
			  c2x = c1x;
			  c2y = c1y;
			  continue;
			}
		} else if (-(tx*t3x + ty*t3y) <= t3x*t3x + t3y*t3y || (xx-c4x)*(c2x-c4x) + (yy-c4y)*(c2y-c4y) >= 0) {
			c0x = c1x;
			c0y = c1y;
			continue;
		}
	}
	return false;
}
return false; // Out of iterations so it is unsure if there was a collision. But have to return something. So assume there isnt
