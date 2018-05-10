///@func scr_get_direction(object, player_number, direction)
///@param object - the character object
///@param player_number - the number of the player
///@param direction - the vector direction of the XAXIS and YAXIS
///@desc given a number direction, it returns the direction type as a string

if (input_array[argument[1], TILT] = NEUTRAL_MOVE) { //neutral attack
	return "neutral"
} else {
	switch (round(argument[3]/90)) { //get direction
		case 0: //right
		case 4: //right
			if (sign(argument[0].image_xscale) = 1) { //facing right
				return "forward"
			} else { //facing left
				return "back"
			}
		break;
		
		case 1: //up
			return "up"
		break;
		
		case 2: //left
			if (sign(argument[0].image_xscale) = -1) { //facing left
				return "forward"
			} else { //facing right
				return "back"
			}
		break;
		
		case 3: //down
			return "down"
		break;
	}
}