///@func scr_momentum_delay(inst, m_x, m_y, mul)
///@param inst - the instance to delay movement for
///@param m_x - the momentum in the x direction
///@param m_y - the moentum in the y direction
///@param mul - the multiplier for frames to hold
///@desc delays a momentum movement for a calculated number of frames
with (argument[0]) {
	mom_x += argument[1]*argument[3]
	mom_y += argument[2]*argument[3]

	if ((abs(mom_x) < 5) and (abs(mom_y) < 5)) { //if -5 < mom_x and mom_y < 5
		inertial = true //end momentum delay
	} else { //otherwise decrease until they are
		inertial = false
		obj_match_handler.state[player_number] = TECHING
	}
} 