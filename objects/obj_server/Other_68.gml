/// @description receive data from clients
var event_id = async_load[? "id"]; //get event id
var count = global.player_number //get the number of players

if ((server = event_id) and (global.network_protocol = network_socket_tcp)) { //client connecting or disconnecting (tcp only)
	var type = async_load[? "type"]; //disconnecting or connecting
	var sock = async_load[? "socket"]; //get the ID of the socket
	var ip = async_load[? "ip"]; //get the IP of the socket
	
	if (type = network_type_connect) { //if connecting
		socket_array[count] = sock //add the socket id entry to the socket array
		var buff = player_buffer
		buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
		buffer_write(buff, buffer_s16, DATA_CMD); //write the input identifer into the buffer
		buffer_write(buff, buffer_u8, global.player_number) //write the player number
		network_send(sock, buff)
	} else { //disconnecting
		var shift = false //used to move all array entries down one
		global.player_number -= 1; //decrease number of players by 1
		for (var i = 0; i <	count - 1; i++) { //for each socket except the last
			if (socket_array[i] = sock) { //if disconnecting client
				shift = true //set shift to true
			} 
			if (shift) { //if shift is true
				//shift all array entries down one place, this also overwrites the slot being shifted to
				socket_array[i] = socket_array[i+1]
			}
		}
	}
} else if (event_id != global.client) { //connected client sending data that isn't itself (udp or tcp)
	var buff = async_load[? "buffer"] //store incoming buffer data
	var cmd = buffer_read(buff, buffer_s16); //store type of incoming data
	var sock = async_load[? "id"]; //get the socket id of the client
	var ip = async_load[? "ip"]; //get the IP of the socket (for UDP usage)
	for (var i = 0; i < count; i++) { //for each socket
		if (socket_array[i] = sock) { //if the socket id mathces the one in the array
			sock = i //sock is set to the player number of the client
			break; //exit the for loop
		}
	}
	switch (cmd) {
		case INPUT_CMD: //read the input buffer sent by the client
			var _index = array_length_1d(network_array) //get current position to fill array
			network_array[_index] = buffer_read(buff, buffer_s16) + 1//read player number
			network_array[++_index] = buffer_read(buff, buffer_s16) //read frame data was sent
			if (!global.advance) { global.advance = true; global.match_frame = network_array[_index]; }
			network_array[++_index] = buffer_read(buff, buffer_f32) //read axis data
			network_array[++_index] = buffer_read(buff, buffer_f32) //read axis data
			for (var o = 2; o < 10; o++) {
				network_array[_index + o] = buffer_read(buff, buffer_s16) //read data
			}
		break;
		
		case DATA_CMD: //read the player data sent by the client
			var num = buffer_read(buff, buffer_string) //read player slot
			for (var o = 0; o < 10; o++) {
				data_array[array_height_2d(data_array), o] = buffer_read(buff, buffer_string) //read data
			}		
		break;
		
		case PLAYER_CMD:
			var i = buffer_read(buff, buffer_s8)
			if (i > 0) {
				global.player_number += 1
				socket_array[count] = async_load[? "socket"] //add the socket id entry to the socket array
				obj_input.player_is_local[global.player_number - 1] = false
			} else {
				scr_unassign_player(i)
			}
		break;
		
		case CHAR_CMD:
			var i = buffer_read(buff, buffer_u8)
			var o = buffer_read(buff, buffer_u8)
			obj_menu_char_select.character[i] = o
			obj_menu_char_select.pal_sprite[i] = scr_get_sprite_simple(o, "pal")
			obj_menu_char_select.sprite[i] = scr_get_sprite_simple(o, "stock")
			obj_menu_char_select.pallet[i] = obj_menu_char_select.pal[BAL]
		break;
		
		case NAME_CMD:
			var i = buffer_read(buff, buffer_u8)
			obj_menu_char_select.name[i] = buffer_read(buff, buffer_string)
		break;
		
		case PING_CMD: //ignore the data, it is used to keep the connection alive
		break;
		
		//... other cases
	}
}