///@func scr_perform_grab(object, player_number, type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the grab with
///@param type - if the grab is grounded or airborne (0 1 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform a grab and returns state

if (argument[0].character = ETH) {
	if !(instance_exists(obj_eth_grab)) {
		var _l = 20 + point_distance(0, 0, input_array[argument[1], XAXIS], input_array[argument[1], YAXIS])*50
		var _d = point_direction(0, 0, input_array[argument[1], XAXIS], input_array[argument[1], YAXIS]) + argument[0].image_angle
		if (_l = 20) { _d += (argument[0].image_xscale - 1)*90 } //flip over if not moving stick
		var _xx = lengthdir_x(_l, _d) + (argument[0].bbox_left + argument[0].bbox_right)/2
		var _yy = lengthdir_y(_l, _d) + (argument[0].bbox_top + argument[0].bbox_bottom)/2
		with (instance_create(_xx, _yy, obj_eth_grab)) {
			creator = argument[0]
			argument[0].child_object = id
		}
	}
} else {
	argument[0].image_index = 0
	if (abs(round(argument[3]/90) - 1) = 1) { //side
		argument[0].sprite_index = scr_get_sprite(argument[0], "grab_side") //set animation to sideways grab
		if (!argument[2]) { //if not airborne
			scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, argument[0].image_xscale, 0), round(_IMPULSE._GRAB/100), false)	
		}
	} else if (round(argument[3]/90) = 1) { //up
		argument[0].sprite_index = scr_get_sprite(argument[0], "grab_up") //set animation to upwards grab
	}
}

return GRABBING	//set state to grabbing
