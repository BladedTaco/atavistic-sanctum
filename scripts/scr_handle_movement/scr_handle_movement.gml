///@func scr_handle_movement(object, player_number, type)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param type - the type of special movement (stop, drift, DI, airborne, delay) (1 2 3 4 5 respectively)
///@desc handles special movement types, possibly ignoring current inputs

var _x1 = input_array[argument[1], XAXIS]
var _y1 = input_array[argument[1], YAXIS]
var _x2 = old_axis[argument[1], XAXIS]
var _y2 = old_axis[argument[1], YAXIS]

switch (argument[2]) {
	case 1: //stop
		argument[0].momentum_x = 0 //remove momentum
		argument[0].momentum_y = 0 //remove momentum
	break;
	
	case 2: //drift
		argument[0].momentum_x *= 0.97/argument[0].inertia //reduce momentum
		argument[0].momentum_y *= 0.85/argument[0].inertia //reduce momentum
		scr_apply_impulse(argument[0], argument[1], 270, _IMPULSE._GRAVITY/100, false) //apply gravity
		if (state[argument[1]] = LANDING) {
			input_array[argument[1], XAXIS] = 0
			input_array[argument[1], YAXIS] = 0
		}
	break;
	
	case 3: //DI
		//slight angle change over time, biggest change is when stick is perpendicular to momentum
		var _dir = point_direction(0, 0, argument[0].momentum_x + _x1, argument[0].momentum_y + _y1)
		var _len = point_distance(0, 0, argument[0].momentum_x, argument[0].momentum_y)
		argument[0].momentum_x = lengthdir_x(_len, _dir)
		argument[0].momentum_y = lengthdir_y(_len, _dir)
	break;
	
	case 4: //airborne
		scr_apply_impulse(argument[0], argument[1], 270, _IMPULSE._GRAVITY/100, false) //apply gravity
		if (abs(_x1) > obj_input.l_stick_deadzone[argument[1]]) { //if moving stick
			scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, _x1, 0), _IMPULSE._AIR_MOVE*point_distance(0, 0, _x1, 0)/100, false)
		}
		//apply friction
		argument[0].momentum_x *= 0.8/argument[0].inertia
		argument[0].momentum_y *= 0.9/argument[0].inertia
	break;
	
	case 5: //momentum delay
		argument[0].mom_x *= 0.75 //reduce momentum counter
		argument[0].mom_y *= 0.75 //reduce momentum counter
		if ((abs(argument[0].mom_x) < 5) and (abs(argument[0].mom_y) < 5)) { //if -5 < mom_x and mom_y < 5
			argument[0].inertial = true //end momentum delay
			state[argument[1]] = scr_perform_freefall(argument[0], argument[1])
		}
	break;
}