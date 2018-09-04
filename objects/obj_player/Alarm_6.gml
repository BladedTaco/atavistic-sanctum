/// @description attacker delete alarm
//if currently being grabbed or held, set this alarm to 1 second
if ((obj_match_handler.state[player_number] = GRABBED) or (obj_match_handler.state[player_number] = HOLDING)) {
	alarm[6] = GAME_SPEED
} else { //otherwise remove attacker
	attacker = noone
}