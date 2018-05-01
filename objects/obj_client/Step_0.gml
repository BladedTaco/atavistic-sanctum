/// @description send data to the server



for (var i = 0; i < 10; i++) {
	for (var o = 0; o < global.input_buffer_length; o++) {
	input_buffer_array[o*100 + 0, i] = obj_player.input_buffer_array[o*100 + 0, i]
	//input_array = obj_player.input_array
	//input_buffer_array = obj_player.input_buffer_array
	}
}

switch (global.network_state) {
	case (NETWORK_PLAY):
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, INPUT_CMD); //write the input identifer into the buffer
		buffer_write(buff, buffer_s16, player_number) //write player number
		buffer_write(buff, buffer_s16, global.match_frame) //write current frame
		for (var o = 0; o < 10; o++) {
			buffer_write(buff, buffer_s16, input_buffer_array[player_number, o]) //write data
		}
	break;
	
	case (NETWORK_LOBBY):
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, DATA_CMD); //write the data identifer into the buffer
		buffer_write(buff, buffer_string, data_array[player_number, 6]) //write player slot
		for (var o = 0; o < 10; o++) {
			buffer_write(buff, buffer_string, data_array[player_number, o]) //write data
		}
	break;
}


network_send(client, buff); //send data to the server



var _input
for (var i = 0; i < 10; i++) {
_input[i] = 9
}
scr_input_buffer(1, _input)