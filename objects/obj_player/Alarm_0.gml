/// @description ledge alarm
//when on ledge - ledge invincibility / ledge safety
//when not on ledge - time until ledge can be re-grabbed

if (obj_match_handler.state[player_number] = LEDGE) { //kick off of ledge
	x -= image_xscale*5
	momentum_y += 5
	alarm[0] = GAME_SPEED*5
	with (obj_match_handler) {
		state[other.player_number] = scr_perform_freefall(other.id, other.player_number)	
	}
}
