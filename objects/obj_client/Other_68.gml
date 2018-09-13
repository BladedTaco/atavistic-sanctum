/// @description Receive data from server
var event_id = async_load[? "id"]; //get event id
global.wait = false

if (client = event_id) { //if data is being sent to this client
	switch (global.network_state) {
		case NETWORK_JOIN:		
			if !(instance_exists(obj_server)) {
				global.network_state = NETWORK_LOBBY
			    var buff = async_load[? "buffer"] //store incoming buffer data
				buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
				if (buffer_read(buff, buffer_s16) = DATA_CMD) { //read the command identifier
					global.player_number = buffer_read(buff, buffer_u8)
					for (var i = 0; i < global.player_number; i++) {
						if (i = buffer_read(buff, buffer_u8)) {
							obj_menu_char_select.name[i] = buffer_read(buff, buffer_string)
							var _char = buffer_read(buff, buffer_u8)
							obj_menu_char_select.character[i] = _char
							obj_menu_char_select.pallet[i] = buffer_read(buff, buffer_u8)	
							obj_menu_char_select.pal_sprite[i] = scr_get_sprite_simple(_char, "pal")
							obj_menu_char_select.sprite[i] = scr_get_sprite_simple(_char, "stock")
							obj_input.controller[i] = true
							obj_input.controller_number[i] = -1
							obj_input.player_is_local[i] = false
						}
					}
				}
			}
		break;
		
	    case NETWORK_LOBBY:
		    var buff = async_load[? "buffer"] //store incoming buffer data
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			switch (buffer_read(buff, buffer_s16)) { //read command
				case DATA_CMD:
				break;
				case PLAYER_CMD:
					var i = buffer_read(buff, buffer_s8)
					var o = buffer_read(buff, buffer_u8)
					if ((i > 0) and (o > global.player_number)) {
						global.player_number += 1
						obj_input.player_is_local[global.player_number - 1] = false
					} else if ((i <= 0) and (o < global.player_number)) {
						scr_unassign_player(-i)
					}
				break;
				case CHAR_CMD:
					var i = buffer_read(buff, buffer_u8)
					var _char = buffer_read(buff, buffer_u8)
					var _pal = buffer_read(buff, buffer_u8)
					obj_menu_char_select.character[i] = _char
					obj_menu_char_select.pal_sprite[i] = scr_get_sprite_simple(_char, "pal")
					obj_menu_char_select.sprite[i] = scr_get_sprite_simple(_char, "stock")
					obj_menu_char_select.pallet[i] = _pal 
				break;
				case NAME_CMD:
					var i = buffer_read(buff, buffer_u8)
					obj_menu_char_select.name[i] = buffer_read(buff, buffer_string)
				break;
				case GAME_CMD:
					global.network_state = NETWORK_PLAY
					var _stage = buffer_read(buff, buffer_s8)
					var _stocks = buffer_read(buff, buffer_u16)
					var _time = buffer_read(buff, buffer_u16)
					obj_menu_char_select.stocks = _stocks
					obj_menu_char_select.time = _time
					scr_start_match(false, _stage)
				break;
			}
			
		break;
		
		case NETWORK_PLAY:
			var buff = async_load[? "buffer"] //store incoming buffer data
			buffer_seek(buff, buffer_seek_start, 0); //seek the start of the buffer
			if (buffer_read(buff, buffer_s16) = INPUT_CMD) {
				var _count = buffer_read(buff, buffer_s16) //read how many data packets have been sent
				for (var i = 0; i < _count; i++) { //for each entry
					var num = buffer_read(buff, buffer_s16) //read player number
					if (obj_input.player_is_local[num]) {
						buffer_seek(buff, buffer_seek_relative, 26) //read past data
					} else {
						var _frame = global.match_frame - buffer_read(buff, buffer_s16)//read frame data was sent and negate from current frame
						obj_input.input_buffer_array[clamp(_frame*100 + num, 0, 32000 - 1), 0] = buffer_read(buff, buffer_f32) //read axis data
						obj_input.input_buffer_array[clamp(_frame*100 + num, 0, 32000 - 1), 1] = buffer_read(buff, buffer_f32) //read axis data
						for (var o = 2; o < 10; o++) {
							obj_input.input_buffer_array[clamp(_frame*100 + num, 0, 32000 - 1), o] = buffer_read(buff, buffer_s16) //read data
						}
					}
				}
			}
		break;
	}
}
