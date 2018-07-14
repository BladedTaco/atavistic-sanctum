/// @description hitstun alarm
image_speed = 1
if (obj_match_handler.state[player_number] = HIT_STUN) { //only change state if being attacked
	obj_match_handler.state[player_number] = AIRBORNE
}
inertial = true