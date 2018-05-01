/// @description send data to clients

var count = global.player_number //get amount of sockets on network as a local variable

if (count > 0) { //if there are sockets to send data to
	switch (global.network_state) {
		case (NETWORK_LOBBY):
			var buff = player_buffer //create a local accessor for the player_buffer
			buffer_seek(buff, buffer_seek_start, 2); //seek the start of the buffer + enough space for a s16
			buffer_write(buff, buffer_u8, count) //write the number of players to the buffer
			for (var i = 0; i < count; i++) { //for each socket
				buffer_write(buff, buffer_s16, i) //write player number
				for (var o = 0; o < 10; o++) {
					buffer_write(buff, buffer_string, data_array[i, o]) //write player data
				}
			}
		break;
		
		case (NETWORK_PLAY):
			if ((1=1) and (irandom(10) = irandom(10))){
				show_debug_message("SENT")
				var buff = player_buffer //create a local accessor for the player buffer
				buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
				buffer_write(buff, buffer_s16, (array_length_1d(network_array))/12) //write the loop count
				show_debug_message(string(array_length_1d(network_array)))
				for (var i = 0; i < array_length_1d(network_array); i++) { //for each socket
					buffer_write(buff, buffer_s16, network_array[i]) //write data
				}
				network_array = []
			} else {
				var buff = player_buffer //create a local accessor for the player buffer
				buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
				for (var i = 0; i < 10; i++) {
				buffer_write(buff, buffer_s16, 0) //write the loop count
				}
			}
		/*
			var buff = player_buffer //create a local accessor for the player buffer
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			buffer_write(buff, buffer_u8, count) //write the number of players to the buffer
			for (var i = 0; i < count; i++) { //for each socket
				buffer_write(buff, buffer_s16, i) //write player number
				buffer_write(buff, buffer_s16, global.match_frame) //write current frame
				for (var j = 0; j <= global.input_buffer_length; j++) {
					for (var o = 0; o < 10; o++) {
						buffer_write(buff, buffer_s16, input_buffer_array[j*100 + i, o]) //write data
					}
				}
			}
			
		*/
		
		break;
	
	
	}
	for (var i = 0; i < count; i++) { //for each socket
		if (global.network_state = NETWORK_LOBBY) {
			buffer_seek(buff, buffer_seek_start, 0) //seek the start of the buffer
			buffer_write(buff, buffer_s16, i) //write the player number to it
		}
		network_send(socket_array[i], player_buffer) //send the data
	}	
}
