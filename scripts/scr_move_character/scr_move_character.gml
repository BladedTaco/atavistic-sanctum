///@func scr_move_character(object, player_number)
///@param object - the instance id of the character object
///@param player_number - the number of the player to handle the movement of
///@desc handles the given characters movement using a base move case.

var _x1 = input_array[argument[1], XAXIS]
var _y1 = input_array[argument[1], YAXIS]
var _x2 = old_axis[argument[1], XAXIS]
var _y2 = old_axis[argument[1], YAXIS]

scr_apply_impulse(argument[0], argument[1], 270, 0.5, false) //gravity
scr_apply_impulse(argument[0], argument[1], point_direction(0, 0, _x1, _y1), point_distance(0, 0, _x1, _y1), false)

if (argument[0].x > room_width) {
	argument[0].x = 5	
}
if (argument[0].x < 0) {
	argument[0].x = 5	
}

if (argument[0].y > room_height) {
	argument[0].y = 5	
}
if (argument[0].y < 0) {
	argument[0].y = 5	
}

argument[0].momentum_x *= 0.8/argument[0].inertia
argument[0].momentum_y *= 0.9/argument[0].inertia


if (position_meeting(argument[0].x + argument[0].momentum_x,
					argument[0].y + argument[0].momentum_y,
					obj_ground)) {
	argument[0].momentum_y = 0	
	argument[0].y = obj_ground.bbox_top
	state[argument[1]] = GROUNDED
	jumps[argument[1]] = argument[0].max_jumps
} else {
	state[argument[1]] = AIRBORNE
	
}