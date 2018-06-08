///@func scr_perform_freefall(id, player_number)
///@param id - the id of the player object
///@param player_number - the player number of the player
///@desc puts the given player into a freefall state

argument[0].sprite_index = scr_get_sprite(argument[0], "hurt_down")
return FREEFALL //return the freefall state