/// @description 

effective_x = 0
effective_y = 0
scr_check_special_instructions(1)

//move
var l = 100
if ((obj_match_handler.state[player_number] != LEDGE_ALT) and (obj_match_handler.state[player_number] != LEDGE) and (image_speed != 0)) {
	var j = max(round(2*point_distance(0, 0, momentum_x, momentum_y)/GROUND_HEIGHT), 1)
	var _ex = effective_x
	var _ey = effective_y
	var _mx = momentum_x
	var _my = momentum_y
	repeat(j) {
		l = 100
		if (inertial) {
			x += _mx/j
			y += _my/j
		}
		while (instance_place(x, y+1, obj_ground) or instance_position(x, y+1, obj_ground)) {
			var _inst = instance_place(x, y+1, obj_ground)
			if !(instance_exists(_inst)) { //if no instance found with sprite mask
				_inst = instance_position(x, y+1, obj_ground) //check for one at coordinates
			}
			if (instance_exists(_inst)) { //if there is an instance of a ground object to check against
				scr_helpless_bounce(_inst, _inst.hitbox, id)
				var _d = point_direction(_inst.x, _inst.y, x + _ex - (momentum_x/j), y + _ey - (momentum_y/j))
				if (((angle_difference(_inst.diag1, _d) > 0) and (angle_difference(_inst.diag2, _d) < 0)) 
				or ((angle_difference(_inst.diag3, _d) > 0) and (angle_difference(_inst.diag4, _d) < 0))) { //above or below
					if (angle_difference(_inst.image_angle, _d) < 0) { //above
						_my = 0 //stop vertical movement while keeping momentum
						_mx = 0 //stop horizontal movement while keeping momentum
						break; //handled elsewhere
					} else { //below
						_d = image_angle - 90
					}
				} else {
					if (angle_difference(_inst.image_angle + 90, _d) < 0) { //left
						_d = image_angle + 180
					} else { //right
						_d = image_angle 
					}
				}
				while (instance_place(x, y+1, _inst)) {
					l--
					x += lengthdir_x(0.25, _d)
					y += lengthdir_y(0.25, _d)
					if (l <= 0) { break; }
				}
			}
			if (l <= 0) { break; }
		}
		if (j <= 0) { break; }
	}
}

if (l <= 0) { //check if still in ground after exceeding loop limit above
	l = 100
	while (instance_place(x, y+1, _inst)*l > 0) {
		y -= 1
		l--
	}
}


//get previous x values
last_x2 = last_x
last_x = xprevious
last_y2 = last_y
last_y = yprevious