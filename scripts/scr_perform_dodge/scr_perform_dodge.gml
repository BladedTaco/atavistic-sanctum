///@func scr_perform_dodge(object, player_number, type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the dodge with
///@param type - whether it is a grounded roll or an airdodge (0 1 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform a dodge and returns state


if (!obj_input.sticky_dodge[argument[1]]) { //if able to dodge
	argument[0].image_index = 0 //set character to first animation frame
	if (argument[2]) { //airborne therefore air dodge
		if (jumps[argument[1]] > 0) { //if able to jump/air-dodge
			jumps[argument[1]] -= 1 //decrement jumps
			argument[0].sprite_index = scr_get_sprite(argument[0], "air_dodge") //set character to airdodge animation
			scr_apply_impulse(argument[0], argument[1], argument[3], _IMPULSE._AIR_DODGE/100) //apply airdodge impulse
			if (lengthdir_x(1, argument[3]) > 0) {
				argument[0].image_xscale = 1//set sprite facing
			} else {
				argument[0].image_xscale = -1//set sprite facing
			}
			obj_input.sticky_dodge[argument[1]] = true 
			return AIR_DODGING //return state
		}
	} else {
		if (abs(round(argument[3] / 90) - 1) = 1) { //direction is left or right
			argument[0].sprite_index = scr_get_sprite(argument[0], "roll") //set character to roll animation
			argument[0].image_xscale = sign(lengthdir_x(1, argument[3])) //set sprite facing
			scr_apply_impulse(argument[0], argument[1], round(argument[3]/180)*180, _IMPULSE._ROLL/100) //apply roll impulse
		} else {
			argument[0].sprite_index = scr_get_sprite(argument[0], "dodge") //set character to dodge animation	
		}
		obj_input.sticky_dodge[argument[1]] = true 
		return DODGING //return state
	}
}

return state[argument[1]] //return current state if unable to dodge or airdodge