/// @description Receive data from server
var event_id = async_load[? "id"]; //get event id

if (client = event_id) { //if data is being sent to this client
	switch (global.network_state) {
	    case NETWORK_LOBBY:
		    var buff = async_load[? "buffer"] //store incoming buffer data
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			player_number = buffer_read(buff, buffer_s16) //get player number
			global.player_number = buffer_read(buff, buffer_u32) //read the number of players
			for (var i = 0; i < global.player_number; i++) { //for each player
				var num = buffer_read(buff, buffer_s16) //read player number
				for (var o = 0; o < 10; o++) {
				data_array[num, o] = buffer_read(buff, buffer_string) //read data	
				}
			}
		break;
		
		case NETWORK_PLAY:
			var buff = async_load[? "buffer"] //store incoming buffer data
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			global.player_number = buffer_read(buff, buffer_u32) //read the number of players
			for (var i = 0; i < global.player_number; i++) { //for each player
				var num = buffer_read(buff, buffer_s16) //read player number
				var _frame = buffer_read(buff, buffer_s16) //read frame data was sent
				for (var j = global.match_frame - _frame; j <= global.input_buffer_length; j++) {
					for (var o = 0; o < 10; o++) {
						input_buffer_array[j*100 + num, o] = buffer_read(buff, buffer_s16) //read data
					}
				}
			}
		break;
	}
}
