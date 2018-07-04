/// @description attacker delete alarm
if ((obj_match_handler.state[player_number] = GRABBED) or (obj_match_handler.state[player_number] = HOLDING)) {
	alarm[6] = GAME_SPEED
} else {
	attacker = noone
}