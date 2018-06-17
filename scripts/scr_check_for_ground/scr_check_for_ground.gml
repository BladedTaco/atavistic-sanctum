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
	var l = max(ceil(point_distance(0, 0, momentum_x, momentum_y)/GROUND_HEIGHT), 1)
	repeat(l) {
		_xx += momentum_x/l
		_yy += momentum_y/l
		with (obj_ground) {
			if (scr_point_in_rec(_xx, _yy, hitbox)) {
				global.ground = id
				return true; //return true if point is colliding with the ground
			}
		}
	
		//if input to fall through platform is being performed
		if ((obj_input.input_array[_inst.player_number, YAXIS] < 0.5) and (obj_input.input_array[_inst.player_number, TILT] < 2)) {
			with (obj_platform) {
				if (scr_point_in_rec(_xx, _yy, hitbox)) {
					global.ground = id
					if (angle_difference(image_angle, point_direction(x, y + 2, _xx - _inst.momentum_x, _yy - _inst.momentum_y)) <= 0) {
						return true //return true if platform is below character and colliding
					}
					global.ground = noone //reset variable if platform is above character
				}
			}
		}
	}
	return false; //return none found
}