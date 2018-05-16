///@func scr_perform_dodge(object, player_number, type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the dodge with
///@param type - whether it is a grounded roll or an airdodge (0 1 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform a dodge and returns state
argument[0].image_index = 0 //set character to first animation frame
if (argument[2]) { //airborne therefore air dodge
	argument[0].sprite_index = scr_get_sprite(argument[0], "air_dodge") //set character to airdodge animation
	scr_apply_impulse(argument[0], argument[1], argument[2], _IMPULSE._AIR_DODGE) //apply airdodge impulse
	return AIR_DODGING //return state
} else {
	if (abs(round(argument[3] / 90) - 1) = 1) { //direction is left or right
		argument[0].sprite_index = scr_get_sprite(argument[0], "roll") //set character to roll animation
		scr_apply_impulse(argument[0], argument[1], round(argument[2]/180)*180, _IMPULSE._ROLL) //apply roll impulse
	} else {
		argument[0].sprite_index = scr_get_sprite(argument[0], "dodge") //set character to dodge animation	
	}
	return DODGING //return state
}

return FREEFALL //i dont see how it is possible to get here, but here is a return in case