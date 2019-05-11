///@func scr_update_network(type, *args)
///@param type - the type of update
///@param *args - additional arguments
///@desc handles network interations for the character select menu

if (instance_exists(obj_client)) {
	if (!instance_exists(obj_server)) { //not hosting
		with (obj_client) {
			switch (argument[0]) {
				case 0: //add player
					if (obj_input.player_is_local[obj_menu_char_select.player_number - 1]) {
						buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
						buffer_write(buff, buffer_s16, PLAYER_CMD); //write the data identifer into the buffer
						buffer_write(buff, buffer_s8, 1)
						network_send(client, buff); //send data to the server
					}
				break;
		
				case 1: //choose character
					buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
					buffer_write(buff, buffer_s16, CHAR_CMD); //write the data identifer into the buffer
					buffer_write(buff, buffer_u8, argument[1]) //write player
					buffer_write(buff, buffer_u8, argument[2]) //write character
					buffer_write(buff, buffer_u8, argument[3]) //write pallet
					network_send(client, buff); //send data to the server
				break;
		
				case 2: //remove player
					buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
					buffer_write(buff, buffer_s16, PLAYER_CMD); //write the data identifer into the buffer
					buffer_write(buff, buffer_s8, -argument[1])
					network_send(client, buff); //send data to the server
				break;
			
				case 3: //rename player
					buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
					buffer_write(buff, buffer_s16, NAME_CMD); //write the data identifer into the buffer
					buffer_write(buff, buffer_u8, argument[1])
					buffer_write(buff, buffer_string, argument[2])
					network_send(client, buff); //send data to the server
				break;
				
				case 4: //start match
					if (global.network_state != NETWORK_PLAY) {
						//global.network_state = NETWORK_PLAY
						buffer_seek(buff, buffer_seek_start, 0)
						buffer_write(buff, buffer_s16, GAME_CMD)
						buffer_write(buff, buffer_s8, argument[1])
						buffer_write(buff, buffer_u16, argument[2])
						buffer_write(buff, buffer_u16, argument[3])
						network_send(client, buff)
					}
				break;
			}
		}
	} else { //hosting
		var _send = false
		with (obj_server) {
			switch (argument[0]) {
				case 0: //add player
					if (obj_input.player_is_local[obj_menu_char_select.player_number - 1]) {
						buffer_seek(player_buffer, buffer_seek_start, 0); //seek the start of the buffer
						buffer_write(player_buffer, buffer_s16, PLAYER_CMD); //write the data identifer into the buffer
						buffer_write(player_buffer, buffer_s8, 1)
						_send = true
					}
				break;
		
				case 1: //choose character
					buffer_seek(player_buffer, buffer_seek_start, 0); //seek the start of the buffer
					buffer_write(player_buffer, buffer_s16, CHAR_CMD); //write the data identifer into the buffer
					buffer_write(player_buffer, buffer_u8, argument[1]) //write player
					buffer_write(player_buffer, buffer_u8, argument[2]) //write character
					buffer_write(player_buffer, buffer_u8, argument[3]) //write pallet
					_send = true
				break;
		
				case 2: //remove player
					buffer_seek(player_buffer, buffer_seek_start, 0); //seek the start of the buffer
					buffer_write(player_buffer, buffer_s16, PLAYER_CMD); //write the data identifer into the buffer
					buffer_write(player_buffer, buffer_s8, -argument[1])
					_send = true
				break;
			
				case 3: //rename player
					buffer_seek(player_buffer, buffer_seek_start, 0); //seek the start of the buffer
					buffer_write(player_buffer, buffer_s16, NAME_CMD); //write the data identifer into the buffer
					buffer_write(player_buffer, buffer_u8, argument[1])
					buffer_write(player_buffer, buffer_string, argument[2])
					_send = true	
				break;
				
				case 4: //start match
					global.network_state = NETWORK_PLAY
					buffer_seek(player_buffer, buffer_seek_start, 0)
					buffer_write(player_buffer, buffer_s16, GAME_CMD)
					buffer_write(player_buffer, buffer_s8, argument[1])
					buffer_write(player_buffer, buffer_u16, argument[2])
					buffer_write(player_buffer, buffer_u16, argument[3])
					_send = true
				break;
			}
			if (_send) {
				for (var i = 0; i < array_length_1d(socket_array); i++) { //for each socket
					network_send(socket_array[i], player_buffer) //send the data
				}
			}
		}
	}
}