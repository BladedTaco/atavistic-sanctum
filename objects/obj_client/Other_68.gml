/// @description Receive data from server
var event_id = async_load[? "id"]; //get event id
global.wait = false

if (client = event_id) { //if data is being sent to this client
	switch (global.network_state) {
		case NETWORK_JOIN:			
			instance_create(-GUI_WIDTH, 0, obj_menu_char_select)
			obj_menu_online.active = false
			global.network_state = NETWORK_LOBBY
		break;
		
	    case NETWORK_LOBBY:
		    var buff = async_load[? "buffer"] //store incoming buffer data
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			player_number = buffer_read(buff, buffer_s16) //get player number
			global.player_number = buffer_read(buff, buffer_u8) //read the number of players
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
			var _count = buffer_read(buff, buffer_s16) //read how many data packets have been sent
			for (var i = 0; i < _count; i++) { //for each entry
				var num = buffer_read(buff, buffer_s16) //read player number
				var _frame = global.match_frame - buffer_read(buff, buffer_s16)//read frame data was sent and negate from current frame
				obj_input.input_buffer_array[clamp(_frame*100 + num, 0, 32000 - 1), 0] = buffer_read(buff, buffer_f32) //read axis data
				obj_input.input_buffer_array[clamp(_frame*100 + num, 0, 32000 - 1), 1] = buffer_read(buff, buffer_f32) //read axis data
				for (var o = 2; o < 10; o++) {
					obj_input.input_buffer_array[clamp(_frame*100 + num, 0, 32000 - 1), o] = buffer_read(buff, buffer_s16) //read data
				}
			}		
		break;
	}
}
