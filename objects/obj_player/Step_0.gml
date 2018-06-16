/// @description 

//move
if (inertial) {
	x += momentum_x
	y += momentum_y	
	if (instance_place(x, y - 1, obj_ground)) {
		var _d = point_direction(0, 0, momentum_x, momentum_y)
		var _l = point_distance(0, 0, momentum_x, momentum_y)/5 + 0.05
		while (instance_place(x, y - 1, obj_ground) and instance_place(x, y, obj_ground)) {
			x -= lengthdir_x(_l, _d)
			y -= lengthdir_y(_l, _d)
		}
	}
}

//get previous x values
last_x2 = last_x
last_x = xprevious
last_y2 = last_y
last_y = yprevious


