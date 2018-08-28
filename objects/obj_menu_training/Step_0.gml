/// @description
if (visible) {
	if (alarm[0] <= 0) { //no input delay alarm
		if (!sub_menu) {
			if (abs(obj_input.input_array[0, XAXIS]) > 0.5) {
				switch (menu_index) {
					case 0: //percentage
						percentage = clamp(percentage + sign(obj_input.input_array[0, XAXIS]), 0, 1000)
						with (obj_player) {
							percentage = other.percentage	
						}
						alarm[0] = 0
					break;
					case 5: //cpu number
						if (sign(obj_input.input_array[0, XAXIS]) = 1) { //increase
							if (global.player_number < 8) { //7 cpus max
								//duplicate a CPU
								global.player_number += 1
								with (obj_match_handler.player[global.player_number - 2]) {
									with (instance_copy(false)) {
										obj_match_handler.player[global.player_number - 1] = id
										player_number = global.player_number - 1
									}
								}
							}
						} else { //decrease
							if (global.player_number > 2) { //at least 1 cpu
								//decrease players
								global.player_number -= 1 
								instance_destroy(obj_match_handler.player[global.player_number ]) //destroy the player
								obj_match_handler.player[global.player_number] = noone //remove the player from the match handler array
							}
						} 
						menu_option[3] = "CPU NO. - " + string(global.player_number - 1)
						alarm[0] = MENU_DELAY
					break;
					case 6: //game speed
						room_speed = clamp(room_speed + sign(obj_input.input_array[0, XAXIS]), 10, 240)
						menu_option[4] = "GAME SPEED. - " + string(room_speed/GAME_SPEED) + "x"	
						alarm[0] = 1
					break;
					case 7: //input lag
						global.input_buffer_length = clamp(global.input_buffer_length + sign(obj_input.input_array[0, XAXIS]), 0, 50)
						menu_option[5] = "INPUT LAG. - " + string(global.input_buffer_length) + " FRAME"
						alarm[0] = MENU_DELAY*0.5
					break;
			
					default:
						menu_index += sign(obj_input.input_array[0, XAXIS])
						alarm[0] = MENU_DELAY
					break; //up or down
				}
			}
			if (abs(obj_input.input_array[0, YAXIS]) > 0.5) {
				switch (menu_index) {
					case 2: case 3: case 10: case 11://down 2 or up 2
						menu_index += 2*sign(obj_input.input_array[0, YAXIS])
					break;
					case 1: case 9: //down 2 or up 1
						if (sign(obj_input.input_array[0, YAXIS]) = 1) { //going down
							menu_index += 2	
						} else { //going up
							menu_index -= 1
						}
					break;
			
					case 4: case 12: //up 2 or down 1
						if (sign(obj_input.input_array[0, YAXIS]) = -1) { //going up
							menu_index -= 2	
						} else { //going down
							menu_index += 1
						}
					break;
			
					default:
						menu_index += sign(obj_input.input_array[0, YAXIS])
					break; //up or down
				}
				alarm[0] = MENU_DELAY
			}
			menu_index = (menu_index + menu_length) mod menu_length //wrap menu index
		}
	}
}