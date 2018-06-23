///@func scr_momentum_delay(inst, m_x, m_y, mul, attack)
///@param inst - the instance to delay movement for
///@param m_x - the momentum in the x direction
///@param m_y - the moentum in the y direction
///@param mul - the multiplier for frames to hold
///@param attack - if it is an attack causing hitstun
///@desc delays a momentum movement for a calculated number of frames
with (argument[0]) {
	mom_x = argument[1]*argument[3]
	mom_y = argument[2]*argument[3]

	if ((point_distance(0, 0, mom_x, mom_y) < 3) and (!argument[4])) { //if small momentum
		inertial = true //end momentum delay
	} else { //otherwise decrease until they are
		inertial = false
		if (argument[4]) { 
			obj_match_handler.state[player_number] = HIT_STUN
		} else {
			obj_match_handler.state[player_number] = TECHING
		}
	}
} 