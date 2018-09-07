///@func scr_update_network(type, *args)
///@param type - the type of update
///@param *args - additional arguments
///@desc handles network interations for the character select menu

if (instance_exists(obj_client) and !instance_exists(obj_server)) {
	with (obj_client) {
		switch (argument[0]) {
			case 0: //add player
				if (obj_client.added_players) {
					if (obj_input.player_is_local[player_number]) {
						buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
						buffer_write(buff, buffer_s16, PLAYER_CMD); //write the data identifer into the buffer
						buffer_write(buff, buffer_s8, 1)
						network_send(client, buff); //send data to the server
					}
				} else if (player_number = global.player_number) {
					obj_client.added_players = true
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
		}
	}
}