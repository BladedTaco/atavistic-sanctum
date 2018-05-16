///@func scr_move_character(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to handle the movement of
///@desc handles the given characters movement using a base move case.
argument[0] = 0

var _x1 = input_array[argument[0], XAXIS]
var _y1 = input_array[argument[0], YAXIS]
var _x2 = old_axis[argument[0], XAXIS]
var _y2 = old_axis[argument[0], YAXIS]