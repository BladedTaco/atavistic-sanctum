/// @description send data to the server

var j = player_number


switch (global.network_state) {
	case (NETWORK_PLAY):
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, INPUT_CMD); //write the input identifer into the buffer
		for (var i = 0; i < global.local_players; i++) {
			buffer_write(buff, buffer_s16, j) //write player number
			buffer_write(buff, buffer_s16, global.match_frame) //write current frame
			buffer_write(buff, buffer_f32, obj_input.input_buffer_array[j, 0]) //write axis data
			buffer_write(buff, buffer_f32, obj_input.input_buffer_array[j, 1]) //write axis data
			for (var o = 2; o < 10; o++) {
				buffer_write(buff, buffer_s16, obj_input.input_buffer_array[j, o]) //write data
			}
		}
	break;
	
	case (NETWORK_LOBBY):
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, DATA_CMD); //write the data identifer into the buffer
		buffer_write(buff, buffer_string, data_array[j, 6]) //write player slot
		for (var o = 0; o < 10; o++) {
			buffer_write(buff, buffer_string, data_array[j, o]) //write data
		}
	break;
}

if (global.network_state != NETWORK_JOIN) {
	network_send(client, buff); //send data to the server
}