///@func scr_perform_freefall(id, player_number)
///@param id - the id of the player object
///@param player_number - the player number of the player
///@desc puts the given player into a freefall state

switch(round(point_direction(0, 0, argument[0].momentum_x, argument[0].momentum_y)/90)) {
	case 0: case 4: //right
		argument[0].sprite_index = scr_get_sprite(argument[0], "hurt_side")
		argument[0].image_xscale = 1
	break;
	case 1: //up
		argument[0].sprite_index = scr_get_sprite(argument[0], "hurt_up")
	break;
	case 2: //left
		argument[0].sprite_index = scr_get_sprite(argument[0], "hurt_side")
		argument[0].image_xscale = -1
	break;
	case 3: //down
		argument[0].sprite_index = scr_get_sprite(argument[0], "hurt_down")
	break;
}
return FREEFALL //return the freefall state
