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
						menu_option[0] = "PERCENTAGE - " + string(percentage) + "%"
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
										pal_surface = surface_create(16, 16)
										surface_copy(pal_surface, 0, 0, other.pal_surface)
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
						room_speed = clamp(room_speed + sign(obj_input.input_array[0, XAXIS]), 6, 240)
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
			
			if (obj_input.input_array[0, ATTACK]) {
				switch (menu_index) {
					//buttons
					case 9: //hitbox visibility
						if (global.show_hitboxes) {
							global.show_hitboxes = false
							menu_option[7] = "HITBOXES: OFF"
						} else {
							global.show_hitboxes = true
							menu_option[7] = "HITBOXES: ON"
						}
						alarm[0] = MENU_DELAY				
					break; 
					case 10: //ui visibility
						if (global.show_ui) {
							global.show_ui = false
							menu_option[8] = "UI: OFF"
						} else {
							global.show_ui = true
							menu_option[8] = "UI: ON"
						}
						alarm[0] = MENU_DELAY
					break;
					case 11: //reset modifers
						//reset settings that aren't dropdowns
						menu_option[0] = "PERCENTAGE - 0%"			//slider
						menu_option[2] = "ACTION: IDLE"				//dropdown
						menu_option[3] = "CPU NO. - 1"				//slider
						menu_option[4] = "GAME SPEED. - 1x"			//slider
						menu_option[5] = "INPUT LAG. - 6 FRAME"		//slider
						menu_option[7] = "HITBOXES: OFF"			//button
						menu_option[8] = "UI: ON"					//button
						percentage = 0
						with (obj_player) {
							percentage = 0	
						}
						cpu_action = "IDLE"
						while (global.player_number > 2) { //more than 1 cpu
							//decrease players
							global.player_number -= 1 
							instance_destroy(obj_match_handler.player[global.player_number ]) //destroy the player
							obj_match_handler.player[global.player_number] = noone //remove the player from the match handler array
						}
						room_speed = GAME_SPEED
						global.input_buffer_length = 6
						global.show_hitboxes = false
						global.show_ui = true
						alarm[0] = MENU_DELAY
					break;
					case 12: //exit
						with (obj_player) {
							instance_destroy()
						}
						instance_destroy(obj_match_handler)
						alarm[1] = 1;
						alarm[0] = GAME_SPEED
					break;
					
					//sliders
					case 0: //percentage
						percentage = 0
						with (obj_player) {
							percentage = 0
						}
						menu_option[0] = "PERCENTAGE - 0%"
						alarm[0] = MENU_DELAY
					break;
					case 5: //cpu number
						while (global.player_number > 2) { //at least 1 cpu
							//decrease players
							global.player_number -= 1 
							instance_destroy(obj_match_handler.player[global.player_number ]) //destroy the player
							obj_match_handler.player[global.player_number] = noone //remove the player from the match handler array
						}
						menu_option[3] = "CPU NO. - 1"
						alarm[0] = MENU_DELAY
					break;
					case 6: //game speed
						room_speed = GAME_SPEED
						menu_option[4] = "GAME SPEED. - 1x"	
						alarm[0] = MENU_DELAY
					break;
					case 7: //input lag
						global.input_buffer_length = 6
						menu_option[5] = "INPUT LAG. - 6 FRAME"
						alarm[0] = MENU_DELAY
					break;
					
					default: //dropdowns
						sub_menu = true
						with (instance_create(0, 0, obj_menu_training_sub)) {
							if (other.menu_index = 8) {
								state = 0
								name = string_delete(other.menu_option[6], 1, 7)
							} else {
								state = other.menu_index
								if (state = 1) {
									name = string_delete(other.menu_option[1], 1, 6)
								} else if (state = 3) {
									name = string_delete(other.menu_option[2], 1, 8)
								}
							}
							event_user(0)
							depth = other.depth - 1
						}
					break;
				}
			}
		}
	}
}

if (room = rm_menu) {
	with (instance_create(GUI_WIDTH, 0, obj_menu_vault)) {
		menu_index = 4	
	}
}