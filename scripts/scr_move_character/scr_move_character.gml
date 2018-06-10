///@func scr_move_character(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to handle the movement of
///@desc handles the given characters movement using a base move case.

var _ret = state[argument[1]] //the state to change the player to
var _x1 = input_array[argument[1], XAXIS]
var _y1 = input_array[argument[1], YAXIS]
var _x2 = old_axis[argument[1], XAXIS]
var _y2 = old_axis[argument[1], YAXIS]
var _end = false //to end a walk or run, or start a dash ro speed up


scr_apply_impulse(argument[0], argument[1], 270, _IMPULSE._GRAVITY/100, false) //apply gravity

if (state[argument[1]] = SPEED_UP) {
	if (argument[0].sprite_index != scr_get_sprite(argument[0], "speed_up")) {
		argument[0].sprite_index = scr_get_sprite(argument[0], "speed_up")
		argument[0].image_index = 0
	}
}
if (state[argument[1]] = DASHING) {
	if (argument[0].sprite_index != scr_get_sprite(argument[0], "dash")) {
		argument[0].sprite_index = scr_get_sprite(argument[0], "dash")
		argument[0].image_index = 0
	}
}

if (_ret = DASH_SLOW) or (_ret = SPEED_DOWN) {
	input_array[argument[1], XAXIS] = old_axis[argument[1], XAXIS]
	input_array[argument[1], YAXIS] = old_axis[argument[1], YAXIS]
} else if (_x1*argument[0].image_xscale > obj_input.l_stick_deadzone[argument[1]]) { //if moving in the right direction
	if (keyboard_check(ord("F"))) { //walking
		scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, _x1, 0), _IMPULSE._WALK*point_distance(0, 0, _x1, 0)/100, false)
		if (_ret != WALKING) {
			_ret = SPEED_UP
		}
	} else { //running

		if ((sign(_x2 - _x1) != sign(_x2)) and (point_distance(_x1, _y1, _x2, _y2) > 0.25)) {
			scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, _x1, 0), _IMPULSE._DASH/100, false)
			_ret = DASHING
		} else {
			scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, _x1, 0), _IMPULSE._RUN*point_distance(0, 0, _x1, 0)/100, false)
			if (_ret != RUNNING) {
				_ret = DASHING
			}	
		}
	}
	if (abs(_x2) < obj_input.l_stick_deadzone[argument[1]]) {
		_end = true
	}
} else if (state[argument[1]] = RUNNING) { //stop running state
	_ret = DASH_SLOW
	_end = true
} else if (state[argument[1]] = WALKING) { //stop walking state
	_ret = SPEED_DOWN
	_end = true
}	



argument[0].momentum_x *= 0.8/argument[0].inertia
argument[0].momentum_y *= 0.9/argument[0].inertia


state[argument[1]] = _ret
if (_end) {
	switch (_ret) {
		case DASHING:
			argument[0].sprite_index = scr_get_sprite(argument[0], "dash")
		break;
		case SPEED_UP:
			argument[0].sprite_index = scr_get_sprite(argument[0], "speed_up")
		break;
		case DASH_SLOW:
			argument[0].sprite_index = scr_get_sprite(argument[0], "dash_slow")
		break;
		case SPEED_DOWN:
			argument[0].sprite_index = scr_get_sprite(argument[0], "speed_down")
		break;
	}
	argument[0].image_index = 0	
}
