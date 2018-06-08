///@func scr_perform_jump_rise(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the jump with
///@desc causes the given character to perform a jump
scr_apply_impulse(argument[0], argument[1], 90, _IMPULSE._JUMPRISE/100, false)
argument[0].momentum_y *= 1.05/argument[0].inertia