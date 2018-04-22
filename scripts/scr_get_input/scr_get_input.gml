///@func scr_get_input(player_number, controller, *controller_number*)
///@param {integer} player_number the number of the player in terms of local players
///@param {boolean} controller true if the input device is a controller, false if it is a keyboard
///@param {integer} controller_number* the number of the controller slot to check
///@desc takes the input from the controller or keyboard and stores it in a general array (input_array)

var _input; //a local variable that will later be an array

_input[0] = 0

if (argument[1]) { //controller inputs
	if (gamepad_is_connected(argument[2])) {
		var j = 0;
		for (var i = 0; i <= array_length_2d(button_array, argument0); i++) {
			if (button_array[argument[0], i] = 0) { //seperator
				j ++
				_input[j] = 0
			}
			if (j < 4) { //stick
				_input[j] = gamepad_axis_value(argument2, button_array[argument[0], i])	
			} else if (j < 6) { //analogue trigger
				_input[j] += gamepad_button_value(argument2, button_array[argument[0], i])	
			} else { //digital button
				_input[j] += gamepad_button_check(argument2, button_array[argument[0], i])	
			}
		}
	}
} else { //keyboard inputs
	
}




input_array[argument[0], 0] = 0 // xaxis
input_array[argument[0], 1] = 0 // yaxis
input_array[argument[0], 2] = 0 // attack_key
input_array[argument[0], 3] = 0 // special_key
input_array[argument[0], 4] = 0 // jump_key
input_array[argument[0], 5] = 0 // pause_key
input_array[argument[0], 6] = 0 // shield_key
input_array[argument[0], 7] = 0 // grab_key
input_array[argument[0], 8] = 0 // taunt_key
input_array[argument[0], 9] = 0 // n/a, tilt, smash (old xaxis and old yaxis substitutes)