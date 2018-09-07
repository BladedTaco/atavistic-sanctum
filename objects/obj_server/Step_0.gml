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
				var buff = player_buffer //create a local accessor for the player buffer
				buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
				buffer_write(buff, buffer_s16, (array_length_1d(network_array) - 1)/12) //write the loop count
				if (array_length_1d(network_array) > 10) { 
					for (var i = 0; i < array_length_1d(network_array); i++) { //for each socket
						if (i mod 13 = 0) {
							buffer_write(buff, buffer_s16, network_array[i]) //write player number
							buffer_write(buff, buffer_s16, network_array[++i]) //write match frame
							buffer_write(buff, buffer_f32, network_array[++i]) //write axis data
							buffer_write(buff, buffer_f32, network_array[++i]) //write axis data
						} else {
							buffer_write(buff, buffer_s16, network_array[i]) //write data
						}
					}
				}
				network_array = []		
				
		break;
	
	
	}
	if (global.network_state != NETWORK_JOIN) {
		for (var i = 0; i < count; i++) { //for each socket
			if (global.network_state = NETWORK_LOBBY) {
				buffer_seek(buff, buffer_seek_start, 0) //seek the start of the buffer
				buffer_write(buff, buffer_s16, i) //write the player number to it
			}
			network_send(socket_array[i], player_buffer) //send the data
		}	
	}
}
