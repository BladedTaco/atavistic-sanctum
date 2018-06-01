///@func scr_point_in_rec(x, y, rectangle)
///@param x - the x position to check
///@param y - the y position to check
///@param rectangle - the rectangle hitbox object
///@desc checks if a given point is inside of a given rotated rectangle


var _id = argument[2]
var _ax = (_id._x[1] - _id._x[0])	// ABx
var _ay = (_id._y[1] - _id._y[0])	// ABy
var _ax3 = (_id._x[3] - _id._x[0])	// ACx
var _ay3 = (_id._y[3] - _id._y[0])	// ACy
var _ax2 = (argument[0] - _id._x[0])// AMx
var _ay2 = (argument[1] - _id._y[0])// AMy
var _ab = _ax*_ax2 + _ay*_ay2 //AB.AM
var _ac = _ax3*_ax2 + _ay3*_ay2 //AC.AM

//check if the point
if (0 < _ab) and (_ab < _ax*_ax + _ay*_ay) { // 0 < AM.AB < AB.AB
	if (0 < _ac) and (_ac < _ax3*_ax3 + _ay3*_ay3) { // 0 < AM.AC < AC.AC
		//point is within retangle
		return true
	}
}
return false //return false if point is not in rectangle