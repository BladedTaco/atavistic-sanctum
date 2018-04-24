///@func scr_handle_c_stick(player_number, c_stick_hori, c_stick_vert)
///@desc change c stick inputs into their outputs
///@param player_number - the player slot number of the player
///@param c_stick_hori - the horizontal value of the c stick
///@param c_stick_vert - the vertical value of the c stick

argument[0] = argument[0]
argument[1] = argument[1]
argument[2] = argument[2]


var j = 9
var k = 1

input_array[argument[0], j] = clamp(input_array[argument[0], j] + k, -1, 1)