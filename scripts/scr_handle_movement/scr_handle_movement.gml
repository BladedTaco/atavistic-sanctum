///@func scr_handle_movement(object, player_number, type)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param type - the type of special movement (stop, drift, DI) (1 2 3 respectively)
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
		argument[0].momentum_x *= 0.95/argument[0].inertia //reduce momentum
		argument[0].momentum_y *= 0.95/argument[0].inertia //reduce momentum
		scr_apply_impulse(argument[0], argument[1], 270, _IMPULSE._GRAVITY/100, false) //apply gravity
	break;
	
	case 3: //DI
		//slight angle change over time, biggest change is when stick is perpendicular to momentum
		var _dir = point_direction(0, 0, argument[0].momentum_x + _x1, argument[0].momentum_y + _y1)
		var _len = point_distance(0, 0, argument[0].momentum_x, argument[0].momentum_y)
		argument[0].momentum_x = lengthdir_x(_len, _dir)
		argument[0].momentum_y = lengthdir_y(_len, _dir)
	break;
}