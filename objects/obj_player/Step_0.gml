/// @description 

effective_x = x
effective_y = y
scr_check_special_instructions(1)

//move
var l = 100
if (inertial and (obj_match_handler.state[player_number] != LEDGE_ALT) and (obj_match_handler.state[player_number] != LEDGE)) {
	var j = max(round(point_distance(0, 0, momentum_x, momentum_y)/2), 1)
	var _ex = effective_x - x
	var _ey = effective_y - y
	repeat(j) {
		l = 100
		x += momentum_x/j
		y += momentum_y/j
		while (instance_place(x, y+1, obj_ground)) {
			var _inst = instance_place(x, y+1, obj_ground)
			if (instance_exists(_inst)) {
				var _d = point_direction(_inst.x, _inst.y, (bbox_right + bbox_left)/2 - momentum_x + _ex, (bbox_top + bbox_bottom)/2 - momentum_y + _ey)
				if (((angle_difference(_inst.diag1, _d) > 0) and (angle_difference(_inst.diag2, _d) < 0)) 
				or ((angle_difference(_inst.diag3, _d) > 0) and (angle_difference(_inst.diag4, _d) < 0))) { //above or below
					if (angle_difference(_inst.image_angle, _d) < 0) { //above
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
	}
}

//get previous x values
last_x2 = last_x
last_x = xprevious
last_y2 = last_y
last_y = yprevious