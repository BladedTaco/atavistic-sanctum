///@func scr_perform_taunt(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the taunt with
///@desc causes the given character to perform a taunt and returns state
argument[0].sprite_index = scr_get_sprite(argument[0], "taunt") //set the taunt animation to the character
argument[0].image_index = 0 //set animation to first frame
return TAUNT //return the state