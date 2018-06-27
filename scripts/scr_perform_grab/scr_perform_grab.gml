///@func scr_perform_grab(object, player_number, type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the grab with
///@param type - if the grab is grounded or airborne (0 1 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform a grab and returns state

argument[0].image_index = 0
if (abs(round(argument[3]/90) - 1) = 1) { //side
	argument[0].sprite_index = scr_get_sprite(argument[0], "grab_side") //set animation to sideways grab
	if (!argument[2]) { //if not airborne
		scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, argument[0].image_xscale, 0), _IMPULSE._GRAB/100, false)	
	}
} else if (round(argument[3]/90) = 1) { //up
	argument[0].sprite_index = scr_get_sprite(argument[0], "grab_up") //set animation to upwards grab
}

return GRABBING	//set state to grabbing
