///@func scr_get_input(player_number, controller, *controller_number*)
///@param {integer} player_number the number of the player in terms of local players
///@param {boolean} controller true if the input device is a controller, false if it is a keyboard
///@param {integer} controller_number* the number of the controller slot to check
///@desc takes the input from the controller or keyboard and stores it in a general array (obj_input.input_array)

var _input; //a local variable that will later be an array used to hold input values temporarily

for (var i = 0; i <= 100; i++) {
	_input[i] = 0
}


if (argument[1]) { //controller inputs
	if (gamepad_is_connected(argument[2])) {
		for (var i = 0; i < 20; i++) {
			if (i < 14) { //button
				_input[button_array[argument[0], i]] += gamepad_button_check(argument[2], button_const_array[i])
			} else if (i < 16) { //analogue button
				if (gamepad_button_value(argument[2], button_const_array[i]) > trigger_threshold[argument[0]]) { //if being pressed
					_input[button_array[argument[0], i]] += 1 
				}
				_input[i] = gamepad_button_value(argument[2], button_const_array[i])
			} else { //directional stick
				_input[button_array[argument[0], i]] = gamepad_axis_value(argument[2], button_const_array[i])	
			}
		}
	scr_handle_directional_stick(argument[0], _input)
	}
} else { //keyboard inputs
	for (var i = 0; i < array_length_2d(button_const_array, argument[0]) - 20; i++) {
		if (i >= 8) { //single button
			_input[button_array[argument[0], i]] += keyboard_check(button_const_array[i + 20])	
		} else { //button pair (axis)
			_input[button_array[argument[0], i]] = keyboard_check(button_const_array[i + 20]) - keyboard_check(button_const_array[i+1 + 20])
			i++
		}
	}
}

scr_handle_c_stick(argument[0], _input)

scr_input_buffer(argument[0], _input)

