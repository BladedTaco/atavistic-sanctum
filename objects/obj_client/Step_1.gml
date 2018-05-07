/// @description 

if ((obj_input.input_buffer_array[global.input_buffer_length*100 + 1, 0] != 9) or (alarm[1] > 0)) {
	global.match_frame ++
	global.wait = false
	room_speed = 60
} else {
	room_speed = 5
	global.wait = true	
}

