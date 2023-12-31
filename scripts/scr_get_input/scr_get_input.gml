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

//check for shield grab
if (_input[SHIELD] and _input[ATTACK]) {
	_input[GRAB] = true
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

if (instance_exists(obj_match_handler) or (paused >= 0)) {
	if !(instance_exists(obj_menu_training)) { //not training
		//check for pause (in match only)
		global.paused = (paused >= 0)
		if (_input[PAUSE]) {
			if (!sticky_pause[argument[0]]) {
				sticky_pause[argument[0]] = true
				if (paused >= 0) { //unpause
					if (paused = argument[0]) {
						paused = -1
						instance_activate_object(obj_replay_handler) //activate replay object if needed
						//get the previous state of input from before the pause
						obj_input.sticky_attack		= array_clone(pause.sticky_attack)	
						obj_input.sticky_dodge		= array_clone(pause.sticky_dodge)		
						obj_input.sticky_jump		= array_clone(pause.sticky_jump)		
						obj_input.sticky_special	= array_clone(pause.sticky_special)
						obj_input.old_axis			= array_clone(pause.old_axis)
						if (instance_exists(obj_replay_handler)) {
							obj_input.input_array		= array_clone(pause.input_array)
						}
					}
				} else { //pause
					paused = argument[0]
				}
			}
		}
	} else {
		if (_input[PAUSE] and !sticky_pause[argument[0]]) { //new pause press
			sticky_pause[argument[0]] = true
			if (!instance_exists(obj_menu_training_sub)) {
				obj_menu_training.visible = !(obj_menu_training.visible) //flip visibility
				obj_menu_training.alarm[0] = global.input_buffer_length + MENU_DELAY
			} else {
				instance_destroy(obj_menu_training_sub)
				obj_menu_training.sub_menu = false
			}
		}
	}
}


if (!_input[PAUSE]) {
	sticky_pause[argument[0]] = max(sticky_pause[argument[0]] - 0.05, 0)	 //slowly decrement a sticky pause to false
}


if (global.debug) { //debug option to only allow 1 player to move at a time
	if (keyboard_check(ord("Z"))) {
		if (!keyboard_check(ord(string(argument[0])))) {  //if this number not beign pressed
			for (var i = 0; i < array_length_1d(_input); i++) {
				_input[i] = 0	//remove all input
			}
		}
	}
}

for (var i = 0; i < array_length_1d(_input); i++) {
	_input[i] = real(string_format(_input[i], 0, 4))	
}

if !(instance_exists(obj_replay_handler) and obj_replay_handler.active) { //if not in a replay
	scr_handle_c_stick(argument[0], _input)
	scr_input_buffer(argument[0], _input)
}

