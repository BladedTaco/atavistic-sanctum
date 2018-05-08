///@func scr_handle_movement(object, player_number, type)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param type - the type of special movement (stop, drift, DI) (1 2 3 respectively)
///@desc causes the given character to perform a taunt
argument[0] = 0

var _x1 = input_array[argument[0], XAXIS]
var _y1 = input_array[argument[0], YAXIS]
var _x2 = old_axis[argument[0], XAXIS]
var _y2 = old_axis[argument[0], YAXIS]