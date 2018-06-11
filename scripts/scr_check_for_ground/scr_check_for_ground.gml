///@func scr_check_for_ground(*inst)
///@param *inst - optional, the instance to perform it with, defaults to self
///@desc checks for the ground with the given instance, or the calling instance if none given
if (argument_count > 0) {
	with (argument[0]) {
		if ((obj_match_handler.state[player_number] = LEDGE) or (obj_match_handler.state[player_number] = LEDGE_ALT)) {
			return false	
		}
		return position_meeting(x + momentum_x,	y + momentum_y + 1,	obj_ground)
	}
} else {
	if ((obj_match_handler.state[player_number] = LEDGE) or (obj_match_handler.state[player_number] = LEDGE_ALT)) {
		return false	
	}
	return position_meeting(x + momentum_x,	y + momentum_y + 1,	obj_ground)
}