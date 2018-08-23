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
	//check for pause (in match only)
	global.paused = (paused >= 0)
	if (_input[PAUSE]) {
		if (!sticky_pause[argument[0]]) {
			sticky_pause[argument[0]] = true
			if (paused >= 0) { //unpause
				if (paused = argument[0]) {
					show_debug_message("\nUNPAUSE\n")
					file_delete("PAUSE_SCREEN") //delete the pause screen
					sprite_delete(pause_sprite)
					paused = -2
					instance_activate_all()
					if (instance_exists(obj_replay_handler)) {
						instance_deactivate_object(obj_menu_replay)
						obj_input.sticky_attack		= obj_replay_handler.sticky_attack	
						obj_input.sticky_dodge		= obj_replay_handler.sticky_dodge		
						obj_input.sticky_jump		= obj_replay_handler.sticky_jump		
						obj_input.sticky_special	= obj_replay_handler.sticky_special
						obj_input.input_array		= obj_replay_handler.input_array
						obj_input.old_axis			= obj_replay_handler.old_axis
					} else {
						instance_deactivate_object(obj_menu_char_select)
					}
				}
			} else { //pause
				show_debug_message("\nPAUSE\n")
				if (instance_exists(obj_replay_handler) and obj_replay_handler.active) {
					replay = true;
					menu_option[2] = "Take Control"
					menu_option[5] = "End Replay"
					obj_replay_handler.old_axis			= obj_input.old_axis
					obj_replay_handler.input_array		= obj_input.input_array
					obj_replay_handler.sticky_attack	= obj_input.sticky_attack
					obj_replay_handler.sticky_dodge		= obj_input.sticky_dodge
					obj_replay_handler.sticky_jump		= obj_input.sticky_jump
					obj_replay_handler.sticky_special	= obj_input.sticky_special
				} else {
					replay = false;
					menu_option[2] = "Input lag: 5 frame"
					menu_option[5] = "FORFEIT"
				}
				screen_save("PAUSE_SCREEN") //create the pause screen
				pause_sprite = sprite_add("PAUSE_SCREEN", 1, false, false, 0, 0)
				paused = argument[0]
				alarm[1] = MENU_DELAY
				instance_deactivate_all(true)
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

