/// @description receive data from clients
var event_id = async_load[? "id"]; //get event id
var count = global.player_number //get the number of players

if ((server = event_id) and (global.network_protocol = network_socket_tcp)) { //client connecting or disconnecting (tcp only)
	var type = async_load[? "type"]; //disconnecting or connecting
	var sock = async_load[? "socket"]; //get the ID of the socket
	var ip = async_load[? "ip"]; //get the IP of the socket
	
	if (type = network_type_connect) { //if connecting
		socket_array[array_length_1d(socket_array)] = sock //add the socket id entry to the socket array
		var buff = player_buffer
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, DATA_CMD); //write the input identifer into the buffer
		buffer_write(buff, buffer_u8, global.player_number) //write the player number
		if (instance_exists(obj_menu_char_select)) {
			for (var i = 0; i < global.player_number; i++) {
				buffer_write(buff, buffer_u8, i)
				buffer_write(buff, buffer_string, obj_menu_char_select.name[i])
				buffer_write(buff, buffer_u8, obj_menu_char_select.character[i])
				buffer_write(buff, buffer_u8, obj_menu_char_select.pallet[i])
			}
		}
		network_send(sock, buff)
	} else { //disconnecting
		for (var i = 0; i <	count; i++) { //for each socket
			if (socket_array[i] = sock) { //if disconnecting client
				global.player_number -= 1; //decrease number of players by 1
				for (var o = i; o < array_length_1d(socket_array)-1; o++) {
					//shift all array entries down one place, this also overwrites the slot being shifted to
					socket_array[o] = socket_array[o+1]
				}
				var _array = array_clone(socket_array)
				socket_array = []
				array_copy(socket_array, 0, _array, 0, array_length_1d(_array)-1)
			} 	
		}
	}
} else if (event_id != global.client) { //connected client sending data that isn't itself (udp or tcp)
	var buff = async_load[? "buffer"] //store incoming buffer data
	var cmd = buffer_read(buff, buffer_s16); //store type of incoming data
	var sock = async_load[? "id"]; //get the socket id of the client
	var ip = async_load[? "ip"]; //get the IP of the socket (for UDP usage)
	switch (cmd) {
		case INPUT_CMD: //read the input buffer sent by the client
			var _index = array_length_1d(network_array) //get current position to fill array
			network_array[_index] = buffer_read(buff, buffer_s16) //read player number
			network_array[++_index] = buffer_read(buff, buffer_s16) //read frame data was sent
			if (!global.advance) { global.advance = true; global.match_frame = network_array[_index]; }
			network_array[++_index] = buffer_read(buff, buffer_f32) //read axis data
			network_array[_index + 1] = buffer_read(buff, buffer_f32) //read axis data
			for (var o = 2; o < 10; o++) {
				network_array[_index + o] = buffer_read(buff, buffer_s16) //read data
			}
		break;
		
		case DATA_CMD: //read the player data sent by the client
		break;
		
		case PLAYER_CMD: //adding or removing player
			var i = buffer_read(buff, buffer_s8)
			if (i > 0) {
				global.player_number += 1
				socket_array[array_length_1d(socket_array)] = sock //add the socket id entry to the socket array
				obj_input.player_is_local[global.player_number - 1] = false
			} else {
				scr_unassign_player(-i)
				count -= 1
			}
			buffer_seek(player_buffer, buffer_seek_start, 0); //seek the start of the buffer
			buffer_write(player_buffer, buffer_s16, PLAYER_CMD); //write the input identifer into the buffer
			buffer_write(player_buffer, buffer_s8, i) //write the identifier
			buffer_write(player_buffer, buffer_u8, global.player_number) //write player number
			for (var i = 0; i < array_length_1d(socket_array); i++) { //for each socket
				if (socket_array[i] != sock) {
					network_send(socket_array[i], player_buffer) //send the data
				}
			}	
		break;
		
		case CHAR_CMD: //chaning character or pallet
			var i = buffer_read(buff, buffer_u8)
			var _char = buffer_read(buff, buffer_u8)
			var _pal = buffer_read(buff, buffer_u8)
			obj_menu_char_select.character[i] = _char
			obj_menu_char_select.pal_sprite[i] = scr_get_sprite_simple(_char, "pal")
			obj_menu_char_select.sprite[i] = scr_get_sprite_simple(_char, "stock")
			obj_menu_char_select.pallet[i] = _pal 
			buffer_seek(player_buffer, buffer_seek_start, 0)
			buffer_write(player_buffer, buffer_s16, CHAR_CMD)
			buffer_write(player_buffer, buffer_u8, i)
			buffer_write(player_buffer, buffer_u8, _char)
			buffer_write(player_buffer, buffer_u8, _pal)
			for (var i = 0; i < array_length_1d(socket_array); i++) { //for each socket
				if (socket_array[i] != sock) {
					network_send(socket_array[i], player_buffer) //send the data
				}
			}	
		break;
		
		case NAME_CMD:
			var i = buffer_read(buff, buffer_u8)
			obj_menu_char_select.name[i] = buffer_read(buff, buffer_string)
			buffer_seek(player_buffer, buffer_seek_start, 0)
			buffer_write(player_buffer, buffer_s16, NAME_CMD)
			buffer_write(player_buffer, buffer_u8, i)
			buffer_write(player_buffer, buffer_string, obj_menu_char_select.name[i])
			for (var i = 0; i < array_length_1d(socket_array); i++) { //for each socket
				if (socket_array[i] != sock) {
					network_send(socket_array[i], player_buffer) //send the data
				}
			}	
		break;
		
		case GAME_CMD:
			var _stage = buffer_read(buff, buffer_s8)
			var _stocks = buffer_read(buff, buffer_u16)
			var _time = buffer_read(buff, buffer_u16)
			obj_menu_char_select.stocks = _stocks
			obj_menu_char_select.time = _time
			scr_start_match(false, _stage)
		break;
		
		case PING_CMD: //ignore the data, it is used to keep the connection alive
		break;
		
		//... other cases
	}
}