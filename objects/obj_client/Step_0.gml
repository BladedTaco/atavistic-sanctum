/// @description send data to the server

var j = player_number


switch (global.network_state) {
	case (NETWORK_PLAY):
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, INPUT_CMD); //write the input identifer into the buffer
		for (var i = 0; i < global.player_number; i++) {
			if (obj_input.player_is_local[i]) {
				buffer_write(buff, buffer_s16, i) //write player number
				buffer_write(buff, buffer_s16, global.match_frame) //write current frame
				buffer_write(buff, buffer_f32, obj_input.input_buffer_array[i, 0]) //write axis data
				buffer_write(buff, buffer_f32, obj_input.input_buffer_array[i, 1]) //write axis data
				for (var o = 2; o < 10; o++) {
					buffer_write(buff, buffer_s16, obj_input.input_buffer_array[i, o]) //write data
				}
			}
		}
		network_send(client, buff); //send data to the server
	break;
	
	case (NETWORK_LOBBY):
	break;
}