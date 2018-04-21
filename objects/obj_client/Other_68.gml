/// @description Receive data from server
var event_id = async_load[? "id"]; //get event id

if (client = event_id) { //if data is being sent to this client
	switch (global.network_state) {
	    case NETWORK_PLAY:
		    var buff = async_load[? "buffer"] //store incoming buffer data
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			global.player_number = buffer_read(buff, buffer_u32) //read the number of players
			for (var i = 0; i < global.player_number; i++) { //for each player
				var num = buffer_read(buff, buffer_s16) //read player number
				data_array[num, 0] = buffer_read(buff, buffer_string) //read player name	
				//...
				//...
				//...
			}
		break;
	}
}
