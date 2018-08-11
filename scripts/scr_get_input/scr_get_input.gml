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
			if (i < 14 + analogue[argument[0]]) { //button
				_input[button_array[argument[0], i]] += gamepad_button_check(argument[2], button_const_array[argument[0], i])
			} else if (i < 16) { //analogue button
				if (gamepad_axis_value(argument[2], button_const_array[argument[0], i])*axis[argument[0], i-10] > trigger_threshold[argument[0]]) { //if being pressed
					_input[button_array[argument[0], i]] = 1 
				}
			} else { //directional stick
				_input[button_array[argument[0], i]] = gamepad_axis_value(argument[2], button_const_array[argument[0], i])*axis[argument[0], i - 16]
			}
		}
	scr_handle_directional_stick(argument[0], _input)
	}
} else { //keyboard inputs
	for (var i = 0; i < array_length_2d(button_const_array, argument[0]) - 20; i++) {
		if (i >= 8) { //single button
			_input[button_array[argument[0], i]] = keyboard_check(button_const_array[argument[0], i + 20])	
		} else { //button pair (axis)
			_input[button_array[argument[0], i]] = keyboard_check(button_const_array[argument[0], i + 20]) - keyboard_check(button_const_array[argument[0], i+1 + 20])
			i++
		}
	}
	if (abs(_input[XAXIS]) + abs(_input[YAXIS]) > l_stick_deadzone[argument[0]]) {
		_input[TILT] += 1 //on moving axis, increment tilt
	}
}

//limit l stick to magnitude of 1
var _len = point_distance(0, 0, _input[XAXIS], _input[YAXIS])
if (_len > 1) {
	_input[XAXIS] /= _len
	_input[YAXIS] /= _len
}

//limit c stick to magnitude of 1
_len = point_distance(0, 0, _input[ALT_XAXIS], _input[ALT_YAXIS])
if (_len > 1) {
	_input[ALT_XAXIS] /= _len
	_input[ALT_YAXIS] /= _len
}

if (instance_exists(obj_match_handler)) {
	//check for pause (in match only)
	global.paused = (paused >= 0)
	if (_input[PAUSE]) {
		if (!sticky_pause[argument[0]]) {
			if (paused >= 0) {
				if (paused = argument[0]) {
					file_delete("PAUSE_SCREEN") //delete the pause screen
					sprite_delete(pause_sprite)
					paused = -1
					instance_activate_all()
					sticky_pause[argument[0]] = true
				}
			} else {
				screen_save("PAUSE_SCREEN") //crreate the pause screen
				pause_sprite = sprite_add("PAUSE_SCREEN", 1, false, false, 0, 0)
				paused = argument[0]
				instance_deactivate_all(true)
				sticky_pause[argument[0]] = true
			}
		}
	} else {
		sticky_pause[argument[0]] = false	
	}
}

scr_handle_c_stick(argument[0], _input)

scr_input_buffer(argument[0], _input)

