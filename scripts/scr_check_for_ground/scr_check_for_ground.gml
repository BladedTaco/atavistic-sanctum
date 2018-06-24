///@func scr_check_for_ground(*inst, *x, *y)
///@param *inst - optional, the instance to perform it with, defaults to self
///@param *xx - optional, the offset for x to check for ground paired with yy
///@param *yy - optional, the offset for y to check for ground paired with xx
///@desc checks for the ground with the given instance, or the calling instance if none given
var _xx, _yy, _inst
if (argument_count > 0) {
	_inst = argument[0]
} else {
	_inst = id
}
with (_inst) {
	_xx = x 
	_yy = y + 1
	
	if (argument_count > 1) {
		_xx += argument[1]
		_yy += argument[2]
	}
	var j = 0
	var l = max(ceil(2*point_distance(0, 0, momentum_x, momentum_y)/GROUND_HEIGHT), 1)
	repeat(l) {
		j++
		_xx += momentum_x/l
		_yy += momentum_y/l
		//check for collision with ground
		with (obj_ground) {
			if (scr_point_in_rec(_xx, _yy, hitbox)) {
				global.ground_distance = j/l
				global.ground = id
				return true; //return true if point is colliding with the ground
			}
		}
	
		//check for collision with platform
		if ((_inst.alarm[1] > 0)) { //if not trying to fall through platform
			with (obj_platform) {
				if (scr_point_in_rec(_xx, _yy, hitbox)) {
					if (angle_difference(image_angle, point_direction(x, y + 2 + _inst.momentum_y, _xx - _inst.momentum_x/l, _yy - _inst.momentum_y/l)) <= 0) {
						global.ground_distance = j/l
						global.ground = id
						return true //return true if platform is below character and colliding
					}
				}
			}
		}
	}
	global.ground_distance = 0
	global.ground = noone
	return false; //return none found
}