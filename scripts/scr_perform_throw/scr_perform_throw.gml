///@func scr_perform_throw(object, player_number, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the taunt with
///@param direction - the input stick direction
///@desc causes the given character to perform a throw and returns state

if (argument[0].character = ETH) { 
	if (argument[0].child_object.can_throw) {
		argument[0].child_object.state = 3 
	} else {
		return HOLDING
	}
} //set grab objects state
argument[0].sprite_index = scr_get_sprite(argument[0], "throw_" + scr_get_direction(argument[0], argument[1], argument[2]))
argument[0].image_index = 0 
return HOLDING //return the statet