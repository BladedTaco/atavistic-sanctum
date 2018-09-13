/// @description 

if (global.network_state = NETWORK_PLAY) {
	if ((obj_input.input_buffer_array[global.input_buffer_length*100 + 1, 0] != 9) or (alarm[1] > 0)) {
		global.wait = false
		room_speed = 60
	} else {
		room_speed = 5
		global.wait = true	
	}
}