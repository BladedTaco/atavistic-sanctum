///@func scr_point_in_cir(x, y, circle)
///@param x - the x position of the point
///@param y - the y position of the point
///@param circle - the instance id of the ellipse hitbox
///@desc check if a point is inside an ellipse
var _id = argument[2]
var _xx, _yy
_xx = argument[0] - _id.x
_yy = argument[1] - _id.y
if (power(_xx*cos(_id._dir) + _yy*sin(_id._dir), 2)/(_id._maj*_id._maj) + power(_xx*sin(_id._dir) - _yy*cos(_id._dir), 2)/(_id._min*_id._min) <= 1) {
	//vertex is within ellipse
	return true
}