///@func scr_input_buffer(player_number)
///@desc handles the input buffer of the player number given and pushes out the inputs for the frame
///@param player_number - the number slot of the player

if (!global.wait) {
	var _index = global.input_buffer_length*100 + argument[0]
	
	//push last position in input_buffer into usable input array
	old_axis[argument[0], 0] = input_array[argument[0], 0] //store old xaxis
	old_axis[argument[0], 1] = input_array[argument[0], 1] //store old yaxis
	for (var i = 0; i < array_length_2d(input_buffer_array, _index); i++) {
		input_array[argument[0], i] = input_buffer_array[_index, i]
	}

	//move all buffer entries down
	repeat (global.input_buffer_length) {
		for (var i = 0; i < array_length_2d(input_buffer_array, _index); i++) {
			input_buffer_array[_index, i] = input_buffer_array[_index-100, i]
		}
		_index -= 100
	}

	//fill the first position in the buffer with this frames inputs
	for (var i = 0; i < 100; i++) {
		input_buffer_array[_index, i] = 0
	}

	//check for termination of sticky jump
	if (sticky_jump[argument[0]] and !input_array[argument[0], JUMP]) {
		sticky_jump[argument[0]] = false
	}
	if (sticky_attack[argument[0]] and !input_array[argument[0], ATTACK]) {
		sticky_attack[argument[0]] = false
	}
	if (sticky_special[argument[0]] and !input_array[argument[0], SPECIAL]) {
		sticky_special[argument[0]] = false
	}

	//check for termination of sticky dodge
	if (sticky_dodge[argument[0]] and ((!input_array[argument[0], SHIELD]) or
		(point_distance(0, 0, input_array[argument[0], XAXIS], input_array[argument[0], YAXIS])
		< l_stick_neutral[argument[0]]))) {
		sticky_dodge[argument[0]] = false
	}
}
