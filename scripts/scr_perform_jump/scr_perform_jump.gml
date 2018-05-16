///@func scr_perform_jump(object, player_number, airborne)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the jump with
///@param airborne - if the player is grounded or airborne (0 1 respectively)
///@desc causes the given character to perform a jump and returns state

argument[0].sprite_index = scr_get_sprite(argument[0], "jump") //set animation to jump animation
argument[0].image_index = 0 //set animation frame to the first one
return JUMPING //return the jumping state