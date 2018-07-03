///@func scr_perform_shield(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@desc causes the given character to perform a shield and returns state

if (argument[0].shield_percentage > 0) { //if able to shield
	if (argument[0].character = GEO) { //moving shield
		with (instance_create(argument[0].x, argument[0].y, obj_shield)) { //with the shield object
			sprite_index = scr_get_sprite(argument[0], "shield_ball") //give it its sprite
			creator = argument[0] //give it its assigned character
		}
	} else { //stationary shield
		argument[0].image_index = 0 //set character to first animation frame
		argument[0].sprite_index = scr_get_sprite(argument[0], "shield") //set character to shield animation
		with (instance_create(argument[0].x, argument[0].y, obj_shield)) { //with a shield object
			sprite_index = scr_get_sprite(argument[0], "shield_ball") //get the sprite
			creator = argument[0] //get the assigned object to protecc
		}	
	}

	return SHIELDING //return the state
} else {
	return state[argument[1]] //return current state, exit the script	
}