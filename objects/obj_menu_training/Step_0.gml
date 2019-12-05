/// @description handle menu
if (visible) {
	if (alarm[0] <= 0) { //no input delay alarm
		if (!sub_menu) { //not in a sub menu
			if (abs(obj_input.input_array[0, XAXIS]) > 0.5) { //moving horizontally
				switch (menu_index) { //based on menu index
					case 0: //percentage
						//clamp percentage to value range
						percentage = clamp(percentage + sign(obj_input.input_array[0, XAXIS]), 0, 1000)
						//update the percentages of each player
						with (obj_player) {
							percentage = other.percentage	
						}
						alarm[0] = 0 //set no input delay
						menu_option[0] = "PERCENTAGE - " + string(percentage) + "%" //update menu text
					break;
					case 5: //cpu number
						if (sign(obj_input.input_array[0, XAXIS]) = 1) { //increase number
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
						} else { //decrease number
							if (global.player_number > 2) { //at least 1 cpu
								//decrease players
								global.player_number -= 1 
								instance_destroy(obj_match_handler.player[global.player_number ]) //destroy the player
								obj_match_handler.player[global.player_number] = noone //remove the player from the match handler array
							}
						} 
						menu_option[3] = "CPU NO. - " + string(global.player_number - 1) //update menu text
						alarm[0] = MENU_DELAY //set input delay
					break;
					case 6: //game speed
						//clamp room speed to range
						room_speed = clamp(room_speed + sign(obj_input.input_array[0, XAXIS]), 6, 240)
						menu_option[4] = "GAME SPEED. - " + string(room_speed/GAME_SPEED) + "x"	 //update menu text
						alarm[0] = 1 //set bare minimum input delay
					break;
					case 7: //input lag
						//clamp input buffer length to range
						global.input_buffer_length = clamp(global.input_buffer_length + sign(obj_input.input_array[0, XAXIS]), 0, 50)
						menu_option[5] = "INPUT LAG. - " + string(global.input_buffer_length) + " FRAME" //update menu text
						alarm[0] = MENU_DELAY*0.5 //set half normal input delay
					break;
			
					default: //moving between options
						menu_index += sign(obj_input.input_array[0, XAXIS]) //move menu index
						alarm[0] = MENU_DELAY //set input delay
					break; 
				}
			}
			if (abs(obj_input.input_array[0, YAXIS]) > 0.5) { //moving vertically
				switch (menu_index) { //based on menu index
					case 2: case 3: case 10: case 11://down 2 or up 2
						menu_index += 2*sign(obj_input.input_array[0, YAXIS]) //move up or down 2 indexes
					break;
					case 1: case 9: //down 2 or up 1
						if (sign(obj_input.input_array[0, YAXIS]) = 1) { //going down
							menu_index += 2	//move down two indexes
						} else { //going up
							menu_index -= 1 //move up one index
						}
					break;
			
					case 4: case 12: //up 2 or down 1
						if (sign(obj_input.input_array[0, YAXIS]) = -1) { //going up
							menu_index -= 2	//move up two indexes
						} else { //going down
							menu_index += 1 //move down one index
						}
					break;
			
					default: //any other option
						menu_index += sign(obj_input.input_array[0, YAXIS]) //move by one menu index
					break; //up or down
				}
				alarm[0] = MENU_DELAY //set input delay
			}
			menu_index = (menu_index + menu_length) mod menu_length //wrap menu index
			
			if (obj_input.input_array[0, ATTACK]) { //if attacking
				switch (menu_index) { //based on menu index
					//buttons
					case 9: //hitbox visibility
						if (global.show_hitboxes) { //hitboxes are to be shown
							global.show_hitboxes = false //make them not to be shown
							menu_option[7] = "HITBOXES: OFF" //update menu text
						} else { //hitboxes re currently to be hidden
							global.show_hitboxes = true //make them to be shown
							menu_option[7] = "HITBOXES: ON" //update menu text
						}
						alarm[0] = MENU_DELAY //set input delay	
					break; 
					case 10: //ui visibility
						if (global.show_ui) { //ui is currently to be shown
							global.show_ui = false //make it be hidden
							menu_option[8] = "UI: OFF" //update menu text
						} else { //ui is currently to be hidden
							global.show_ui = true //make it be shown
							menu_option[8] = "UI: ON" //update menu text
						}
						alarm[0] = MENU_DELAY //set input delay
					break;
					case 11: //reset modifers
						//reset settings that aren't dropdowns
						menu_option[0] = "PERCENTAGE - 0%"			//slider
						menu_option[2] = "ACTION: IDLE"				//dropdown
						menu_option[3] = "CPU NO. - 1"				//slider
						menu_option[4] = "GAME SPEED. - 1x"			//slider
						menu_option[5] = "INPUT LAG. - 0 FRAME"		//slider
						menu_option[7] = "HITBOXES: OFF"			//button
						menu_option[8] = "UI: ON"					//button
						percentage = 0 //reset percentage
						//update players percentage
						with (obj_player) {
							percentage = 0	
						}
						cpu_action = "IDLE" //reset cpu action
						while (global.player_number > 2) { //more than 1 cpu
							//decrease players
							global.player_number -= 1 
							instance_destroy(obj_match_handler.player[global.player_number ]) //destroy the player
							obj_match_handler.player[global.player_number] = noone //remove the player from the match handler array
						}
						//reset game modifiers
						room_speed = GAME_SPEED
						global.input_buffer_length = 0
						global.show_hitboxes = false
						global.show_ui = true
						alarm[0] = MENU_DELAY //set input delay
						//return each player to their spawn point
						with (obj_spawn_point) {
							if (number < global.player_number) {
								obj_match_handler.player[number].x = x
								obj_match_handler.player[number].y = y
							}
						}
					break;
					case 12: //exit
						//destroy each player
						with (obj_player) {
							instance_destroy()
						}
						instance_destroy(obj_match_handler) //destroy the match handler
						alarm[1] = 1; //set the exit alarm
						alarm[0] = GAME_SPEED //set input delay
						scr_reset_players() //reset players
					break;
					
					//sliders
					case 0: //percentage
						percentage = 0 //reset percentage
						//update each players percentage
						with (obj_player) {
							percentage = 0
						}
						menu_option[0] = "PERCENTAGE - 0%" //update menu text
						alarm[0] = MENU_DELAY //set input delay
					break;
					case 5: //cpu number
						while (global.player_number > 2) { //at least 1 cpu
							//decrease players
							global.player_number -= 1 
							instance_destroy(obj_match_handler.player[global.player_number ]) //destroy the player
							obj_match_handler.player[global.player_number] = noone //remove the player from the match handler array
						}
						menu_option[3] = "CPU NO. - 1" //update menu text
						alarm[0] = MENU_DELAY //set input delay
					break;
					case 6: //game speed
						room_speed = GAME_SPEED //reset game speed
						menu_option[4] = "GAME SPEED. - 1x"	 //update menu text
						alarm[0] = MENU_DELAY //set input delay
					break;
					case 7: //input lag
						global.input_buffer_length = 0 //reset input lag
						menu_option[5] = "INPUT LAG. - 0 FRAME" //update menu text
						alarm[0] = MENU_DELAY //set input delay
					break;
					
					default: //dropdowns
						sub_menu = true //go into sub menu
						//create the dropdown menu and give it its selected option and state
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
							event_user(0) //populate its menu
							depth = other.depth - 1 //make it appear above other menu
						}
					break;
				}
			}
		}
	}
}

if (room = rm_menu) { //if in the menu room
	//move to the vault menu
	with (instance_create(GUI_WIDTH, 0, obj_menu_vault)) {
		menu_index = 4	
	}
}