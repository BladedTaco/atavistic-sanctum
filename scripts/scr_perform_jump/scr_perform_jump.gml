///@func scr_perform_jump(object, player_number, airborne)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the jump with
///@param airborne - if the player is grounded or airborne (0 1 respectively)
///@desc causes the given character to perform a jump and returns state

if (argument[0].momentum_y >= 0) { //if able to jump
	if (argument[2] and (!obj_input.sticky_jump[argument[1]])) { //air jump
		if (jumps[argument[1]] > 0) {
			argument[0].momentum_y = 0
			jumps[argument[1]] -= 1
			scr_apply_impulse(argument[0], argument[1], 90, _IMPULSE._JUMP/100, false)
			argument[0].sprite_index = scr_get_sprite(argument[0], "air_jump") //set animation to air jumpanimation
			argument[0].image_index = 0 //set animation frame to the first one
		} else {
			return state[argument[1]] //return no change in state id unable to jump
		}
	} else { //grounded jump
		argument[0].sprite_index = scr_get_sprite(argument[0], "air_move") //set animation to air move animation
		argument[0].image_index = 0 //set animation frame to the first one
		scr_apply_impulse(argument[0], argument[1], 90, _IMPULSE._JUMP/100, false)
	}
	obj_input.sticky_jump[argument[1]] = true //set sticky jump to true
	return JUMP_RISE //return the jumping state
} else { return state[argument[1]] } //else return current state