/// @description 

if (paused >= 0) { //if paused
	if (sprite_exists(pause_sprite)) { //if there is a background sprite
		draw_sprite(pause_sprite, 0, 0, 0)	//draw it
	}
	//set draw options and draw background dimming rectangle
	draw_set_alpha(0.45)
	draw_set_colour(c_black)
	draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false)
	//draw a rectangle along the top of the screen
	draw_set_alpha(1)
	draw_rectangle(0, 0, GUI_WIDTH, 50, false)
	//set more draw options and draw who has paused to the middle of the screen
	draw_set_font(fnt_pixel_4)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT/2, c_black, c_white, "PAUSED: PLAYER " + string(paused + 1), 4)
	draw_set_font(fnt_pixel_3)
	var _col = $3f3f3f
	var _len = array_length_1d(menu_option)
	for (var i = 0; i < _len; i++) { //for each menu option
		if (i = menu_index) { //if the option is selcted
			_col = $7f7f7f //use a light gray colour
		} else { //if the option is not selected
			_col = $3f3f3f //use a dark gray colour
		}
		//draw the menu option at its place with the above colour
		draw_text_outlined((((i - menu_index + _len + 2.5) mod _len) - 0.5)*GUI_WIDTH/4, 20, _col, c_white, menu_option[i mod _len], 3)
	}
	if (menu_index != round(menu_index)) { //moving menu option
		//handle menu shifting
		menu_index = ((menu_index + 0.05*menu_direction) + _len) mod _len
		if (abs(menu_index - round(menu_index)) < 0.05) { //if small gap to integer
			menu_direction = 0 //stop moving menu_index
			menu_index = round(menu_index) //round menu index
		}
	} else { //control menu
		if (alarm[1] <= 0) { //if input alarm isnt active
			//check for menu movement
			if (abs(input_array[paused, XAXIS]) > 0.5) {
				menu_direction = sign(input_array[paused, XAXIS])
				menu_index = ((menu_index + 0.05*menu_direction) + _len) mod _len
			}
		
			//check for menu selection
			if ((input_array[paused, ATTACK] and !sticky_attack[paused]) or ((menu_index = 2) and (!replay)) or (menu_index = 3)) {
				sticky_attack[paused] = true //set sticky attack to true to prevent turbo pressing
				var _end = false //variable for handling the difference between resume and forfeit
				switch (menu_index) { 
					case 5: //forfeit
						_end = true //set forfeit flag to true
					case 0: //resume
						instance_activate_object(obj_replay_handler) //activate replay object if needed
						//get the previous state of input from before the pause
						obj_input.sticky_attack		= array_clone(pause.sticky_attack)	
						obj_input.sticky_dodge		= array_clone(pause.sticky_dodge)		
						obj_input.sticky_jump		= array_clone(pause.sticky_jump)		
						obj_input.sticky_special	= array_clone(pause.sticky_special)
						obj_input.old_axis			= array_clone(pause.old_axis)
						if (instance_exists(obj_replay_handler)) { //if in a replay
							obj_input.input_array		= array_clone(pause.input_array) //copy input from replay handler
						}
						if (_end) { //forfeit
							forfeiter = paused //set the forfeiter
							alarm[2] = 2 //set game to end next frame	
						}
						paused = -1 //unpause
					break;
					case 1: //hitboxes: shwon
						if (global.show_hitboxes) { //if hitboxes are currently to be shown
							global.show_hitboxes = false //make them not to be shown
							menu_option[1] = "hitboxes: hidden" //update the menu option text
						} else { //if the hitboxes are currently to be hidden
							global.show_hitboxes = true //make them to be shown
							menu_option[1] = "hitboxes: shown" //update the menu option text
						}
					break;
					case 2:
						if (replay) { //in a replay, this is "take control" by default
							//delete the pause screen
							file_delete("PAUSE_SCREEN") 
							sprite_delete(pause_sprite) 
							//activate all instances and re-deactivate replay menu
							instance_activate_all()
							obj_replay_handler.active = false
							instance_deactivate_object(obj_menu_replay)
							paused = -1; //unpause
						} else { //not in a reaply, this is "Input buffer: 6 frames" by default
							if (alarm[1] <= 0) { //if no input delay currently
								alarm[1] = GAME_SPEED/10 //set input delay
								if (input_array[paused, YAXIS] > 0.5) { //if pressing down
									global.input_buffer_length = max(global.input_buffer_length - 1, 0) //decrease buffer length
								} else if (input_array[paused, YAXIS] < -0.5) { //if pressing up
									global.input_buffer_length = min(global.input_buffer_length + 1, 30) //increase buffer length
								}
								menu_option[2] = "Input lag: " + string(global.input_buffer_length) + " frame" //update menu option text
							}
						}
					break;
					case 3: //game speed: 1x
						if (alarm[1] <= 0) { //if no input delay
							alarm[1] = GAME_SPEED/10 //set input delay
							if (input_array[paused, YAXIS] > 0.5) { //if moving down
								room_speed = max(room_speed - 1, 10) //decrease game speed
							} else if (input_array[paused, YAXIS] < -0.5) { //if moving up
								room_speed = min(room_speed + 1, 120) //increase game speed
							}
							menu_option[3] = "game speed: " + string(room_speed/GAME_SPEED) + "x" //update menu option text
						}
					break;
					case 4: //UI: Shwon
						if (global.show_ui) { //if ui is to be shown
							global.show_ui = false //hide ui
							menu_option[3] = "ui: hidden" //update menu option text
						} else { //if ui is currently to be hidden
							global.show_ui = true //show ui
							menu_option[3] = "ui: shown" //update menu option text
						}
					break;
				}
			}
		}
	}
}
