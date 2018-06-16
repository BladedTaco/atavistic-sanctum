///@func scr_check_for_ground(*inst, *x, *y)
///@param *inst - optional, the instance to perform it with, defaults to self
///@param *xx - optional, the offset for x to check for ground paired with yy
///@param *yy - optional, the offset for y to check for ground paired with xx
///@desc checks for the ground with the given instance, or the calling instance if none given
var _xx, _yy
if (argument_count > 0) {
	with (argument[0]) {
		_xx = x //+ momentum_x
		_yy = y + momentum_y + 1
	}
} else {
	_xx = x //+ momentum_x
	_yy = y + momentum_y + 1
}

if (argument_count > 1) {
	_xx += argument[1]
	_yy += argument[2]
}

with (obj_ground) {
	if (scr_point_in_rec(_xx, _yy, hitbox)) {
		global.ground = id
		return true; //return true if point is colliding with the ground
	}
}

return false //return false if point is not colliding with the ground