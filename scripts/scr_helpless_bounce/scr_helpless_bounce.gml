///@func scr_helpless_bounce(ground_object, ground_hitbox, player)
///@param ground_object - the ground object to bounce off of
///@param ground_hitbox - the hitbox object of the ground_object
///@param player - the player object that is bouncing
var _inst = argument[0] //ground
var _id = argument[1] //hitbox
var _i_max = 3 //the maximum value for i to reach
with (argument[2]) {//creator) {
	if (inertial and (obj_match_handler.state[player_number] = HELPLESS) and !spawning) { //if colliding into ground
		//move to top of ground
		var _mx = momentum_x
		var _my = momentum_y
		var _d = point_direction(0, 0, momentum_x, momentum_y) //get momentum direction
		var _l = point_distance(0, 0, momentum_x, momentum_y)*0.85 //get momentum length with a small reduction
		//move opposite of momentum until out of the ground
		while (instance_place(x, y, obj_ground)) {
			//move
			x -= lengthdir_x(1, _d)
			y -= lengthdir_y(1, _d)
		}
		//move opposite of momentum until out of the platform
		while (instance_place(x, y, obj_platform)) {
			_i_max = 0 //change i max so it only checks the top side of the hitbox
			//move
			x -= lengthdir_x(1, _d)
			y -= lengthdir_y(1, _d)
		}
		
		scr_momentum_delay(id, momentum_x, momentum_y, 1, false) //delay momentum
		//check for y difference
		switch(round((point_direction(x, y, _inst.x, _inst.y) - _inst.image_angle)/45) mod 8) {
			case 0: //moving right
				helpless_sprite = scr_get_sprite(id, "hurt_side")	
			break;
			case 4: //moving left
				helpless_sprite = scr_get_sprite(id, "hurt_side")
			break;
			case 1: case 2: case 3: //moving down
				helpless_sprite = scr_get_sprite(id, "hurt_down")
			break;
			case 5: case 6: case 7: //moving up
				helpless_sprite = scr_get_sprite(id, "hurt_up")
			break;
		}
		var _xx = x - momentum_x*2
		var _yy = y - momentum_y*2
		for (var i = 0; i <= _i_max; i++) {
			if (sign((_xx - _id._x[i])*(_id._y[(i+1) mod 4] - _id._y[i]) - 
			(_yy - _id._y[i])*(_id._x[(i+1) mod 4] - _id._x[i])) != _id.side[i]) { //outside line
				var _d = point_direction(momentum_x, momentum_y, 0, 0)
				var _d2 = (point_direction(_id._x[i], _id._y[i], _id._x[(i+1) mod 4], _id._y[(i+1) mod 4]) + 90) mod 360
				_d = _d2 - _d
				_d = _d + _d2
				momentum_x = lengthdir_x(_l, _d) //bounce off wall with previous momentum reduction
				momentum_y = lengthdir_y(_l, _d) //bounce off wall with previous momentum reduction
				break; //break the loop if the collision change is found
			}
		}
		//update momentums
		new_momentum_x = momentum_x
		new_momentum_y = momentum_y
		momentum_x = _mx
		momentum_y = _my
	}
}