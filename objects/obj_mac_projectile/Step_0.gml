/// @description

//get direction
if (obj_input.input_array[creator.player_number, TILT] > NEUTRAL_MOVE) {
	var _d = point_direction(0, 0, obj_input.input_array[creator.player_number, XAXIS], obj_input.input_array[creator.player_number, YAXIS])
} else {
	var _d = last_dir
}

last_dir -= angle_difference(last_dir, _d) * 0.075; //restrict angle change

_d = last_dir
//move in direction
x += lengthdir_x(3, _d)
y += lengthdir_y(3, _d)

if (alarm[0] <= GAME_SPEED*3) {
	global.bbox[10] = id
	scr_check_collision(CIRCLE, 12, 12, x, y, 0, 1, _d, 1, 0, 3) //create hitbox
	scr_check_collision(CIRCLE, 6, 6, x, y, 0) //create hurtbox
}