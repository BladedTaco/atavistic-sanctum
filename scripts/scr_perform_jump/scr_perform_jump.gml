///@func scr_perform_jump(object, player_number, airborne)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the jump with
///@param airborne - if the player is grounded or airborne (0 1 respectively)
///@desc causes the given character to perform a jump and returns state

argument[0].sprite_index = scr_get_sprite(argument[0], "jump") //set animation to jump animation
argument[0].image_index = 0 //set animation frame to the first one
if (state[argument[1]] = AIRBORNE) {
	if (jumps[argument[1]] > 0) {
		argument[0].momentum_y = 0
		jumps[argument[1]] -= 1
		scr_apply_impulse(argument[0], argument[1], 90, _IMPULSE._JUMP, false)
	}
} else {
	scr_apply_impulse(argument[0], argument[1], 90, _IMPULSE._JUMP, false)
}
return JUMPING //return the jumping state