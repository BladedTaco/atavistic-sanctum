/// @description 

if (global.show_ui) { //if ui is to be shown
	var _alpha = 1 //set opacity to 100%
	for (var i = 0; i < global.player_number; i++) { //for each player
		with (player[i]) { //with that player
			//set draw options
			draw_set_valign(fa_middle)
			draw_set_font(fnt_pixel_3)
			//get positions on the GUI based on player number
			var _xx = round(GUI_WIDTH*((player_number + 0.5)/(global.player_number)) + 5)
			var _yy = round(GUI_HEIGHT + max((1 - (draw_count/GAME_SPEED))*50, 0))
			var _xx2 = camera_get_view_x(view_camera[0]) + (camera_get_view_width(view_camera[0])*((player_number + 0.5)/(global.player_number)) + 5)
			var _scl = camera_get_view_width(view_camera[0])/GUI_WIDTH
			//if there is a player behind a gui element, set it to be drawn slightly transparent
			if (collision_rectangle(_xx2 - 50*_scl, room_height + 100, _xx2 + 50*_scl, room_height - 45*_scl, obj_player, false, false)) {
				draw_set_alpha(0.4)
				_alpha = 0.4
			} else {
				draw_set_alpha(1)
				_alpha = 1
			}
			if (dead) { //if dead player
				draw_set_alpha(0.5*_alpha) //reduce transpr
				var _inst; //initialise variable
				for (var o = 0; o < min(array_length_2d(obj_results.kills, player_number), 4); o++) { //for the first 4 kills
					_inst = obj_results.kills[player_number, o] //get the players
					if (_inst >= 0) { //if the killed instance exists
						with (other.player[_inst]) { //with that instance
							//draw their stock icon
							pal_swap_set(pal_surface, 1, true)
							draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx + o*30 - 50, _yy - 20, 2, 2, 0, img_blend, 0.5*_alpha)
							pal_swap_reset()
						}
					}
				}
				for (var o = 0; o < min(array_length_2d(obj_results.deaths, player_number), 4); o++) { //for the first 4 deaths
					_inst = obj_results.deaths[player_number, o] //get the killer
					if (_inst >= 0) { //if they exist
						with (other.player[_inst]) { //with that instance
							//draw their stock icon
							pal_swap_set(pal_surface, 1, true)
							draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx + o*30 - 50, _yy, 2, 2, 0, img_blend, 0.5*_alpha)
							pal_swap_reset()
						}
					}
				}
				//draw K and D to signify kills and deaths
				draw_text_normal(_xx - 45, _yy - 36, "K")
				draw_text_normal(_xx - 45, _yy - 16, "D")
				draw_set_alpha(1) //reset draw alpha
			} else { //if player is alive
				for (var o = 0; o < stocks; o++) { //for each of their stocks
					//draw an outlined circle
					draw_circle_colour(_xx - 5 + round(((o + 0.5)/stocks)*110 - 55), _yy - 38, 5, c_black, c_black, false)
					draw_circle_colour(_xx - 5 + round(((o + 0.5)/stocks)*110 - 55), _yy - 38, 3, player_col, player_col, false)
				}
				//draw percentage
				draw_text_outlined(_xx + 25, _yy - 25, c_black, merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1)), string(round(percentage)) + "%", 2)
				//draw shield meter
				draw_healthbar(_xx - 5, _yy, _xx + 50, _yy - 5, 100*shield_percentage/shield_max_percentage, c_black, c_red, c_green, 0, true, false)
				//if the player is able to jump mid air, draw the jump meter
				if (max_jumps > 0) { draw_healthbar(_xx - 57, _yy, _xx - 52, _yy - 30, 100*other.jumps[player_number]/max_jumps, c_black, c_red, c_green, 2, true, false) }
				//draw their stock icon with their pallet swap
				pal_swap_set(pal_surface, 1, true)
				draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx - 30, _yy, 3, 3, 0, image_blend, _alpha)
				pal_swap_reset()
			
				//draw attacker if just died
				if (spawning) {
					if (instance_exists(attacker)) {
						with (attacker) { //with the attacker
							//draw their stock icon with an increasing transparency
							pal_swap_set(pal_surface, 1, true)
							draw_sprite_ext(scr_get_sprite(id, "stock"), 0, _xx, GUI_HEIGHT - 5, 3, 3, 0, img_blend, _alpha*(1 - (other.draw_count/GAME_SPEED)))
							pal_swap_reset()
						}
					}	
				}
			
				//draw marker
				_scl = 1/_scl //get inverse of scale
				//set draw options
				draw_set_alpha(1)
				draw_set_halign(fa_center)
				draw_set_valign(fa_bottom)
				draw_set_font(fnt_pixel_2)
				var _d = degtorad(-image_angle) //get degrees in radians
				//get position to draw marker
				_xx = (x + effective_x)*_scl + (45*_scl)*sin(_d) - camera_get_view_x(view_camera[0])*_scl
				_yy = (y + effective_y)*_scl - (45*_scl)*cos(_d) - camera_get_view_y(view_camera[0])*_scl
				draw_sprite_ext(spr_marker, 0, _xx, _yy, 2, 2, 0, player_col, 1) //draw marker
				draw_text_outlined(_xx, _yy - 10, c_black, player_col, name, 2) //draw name
				//draw percentage
				draw_text_outlined(_xx, _yy - 24, c_black, merge_colour(merge_colour(c_white, $0000ff, min(percentage/100, 1)), $00004f, clamp((percentage-100)/300, 0, 1)), string(round(percentage)) + "%", 2)
			}
		}
		
		if (global.player_outside) { //if a player is outside room boundaries
			_scl = floor(obj_blast_zone.bbox_right/180) //the inverse of the scale of the blast zone indicator
			var _bor = 30 - (obj_blast_zone.bbox_left/_scl) //the border from the top left of the screen for the play area box
			draw_set_alpha(0.5) //draw half transparent
			global.player_outside = false //reset the variable
			draw_set_colour(c_black) //set draw colour and draw background of size blast zone
			draw_rectangle(_bor + obj_blast_zone.bbox_left/_scl, _bor + obj_blast_zone.bbox_top/_scl, _bor + obj_blast_zone.bbox_right/_scl, _bor + obj_blast_zone.bbox_bottom/_scl, false)
			//set draw colour and draw rectangles for room bounds and blast zone
			draw_set_colour(c_white)
			draw_rectangle(_bor - 1 + obj_blast_zone.bbox_left/_scl, _bor - 1 + obj_blast_zone.bbox_top/_scl, _bor + 1 + obj_blast_zone.bbox_right/_scl, _bor + 1 + obj_blast_zone.bbox_bottom/_scl, true)
			draw_rectangle(_bor, _bor, _bor + room_width/_scl, _bor + room_height/_scl, true)
			with (obj_ground) { //with each ground object, draw their top line in lightgray
				draw_line_colour(_bor + hitbox._x[0]/_scl, _bor + hitbox._y[0]/_scl, _bor + hitbox._x[1]/_scl, _bor + hitbox._y[1]/_scl, c_ltgray, c_ltgray)
			} 
			with (obj_platform) { //with each platform object, draw their top line in aqua
				draw_line_colour(_bor + hitbox._x[0]/_scl, _bor + hitbox._y[0]/_scl, _bor + hitbox._x[1]/_scl, _bor + hitbox._y[1]/_scl, c_aqua, c_aqua)
			}
			with (obj_ledge) { //with each lede object, draw a hollow yellow circle
				draw_circle_colour(round(_bor + x/_scl), round(_bor + y/_scl), 1.5, c_yellow, c_yellow, true)	
			}
			with (obj_player) { //with each player object
				if (!dead) { //in alive, draw a filled cricle of the players colour
					draw_circle_colour(round(_bor + (x+effective_x)/_scl), round(_bor + (y+effective_y)/_scl), 3, player_col, player_col, false)
				}
			}
			draw_set_alpha(1) //reset draw alpha
		}
	}

 
	if (alarm[0] > 0) { //if match timer is running
		draw_set_font(fnt_pixel_4) //set font
		var _str = "" //the time formatted string of the alarm
		if (alarm[0] >= 3600*GAME_SPEED) { //timer longer than an hour
			_str += string(floor(alarm[0]/(3600*GAME_SPEED))) + ":" //add hours and a colon
			//if the minute component is less than 10, add a 0 to the start
			if (string_length(string(floor((alarm[0]/(60*GAME_SPEED)) mod 60))) = 1) {
				_str += "0"
			}
		}
		if (alarm[0] >= 60*GAME_SPEED) { //timer longer than a minute
			_str += string(floor((alarm[0]/(60*GAME_SPEED)) mod 60)) + ":" //add minutes and a colon
			//if the seconds component is less than 10, add a 0 to the start
			if (string_length(string(floor((alarm[0]/(GAME_SPEED)) mod 60))) = 1) {
				_str += "0"
			}
		}
		_str += string(((alarm[0]/GAME_SPEED) mod 60) + 0.01) //add seconds as a decimal
		draw_text_outlined(GUI_WIDTH/2, 40, c_black, c_white, _str, 4) //draw the string
	}
}

if (starting > -1) { //if match hasn't started fully yet
	draw_set_font(fnt_pixel_16) //set font to be absoultely huge
	if (starting <= 0) { //playes are moving
		if (instance_exists(obj_menu_training)) { //if training
			//draw the word train
			draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT/2, c_black, c_white, "TRAIN", 16)
		} else { //if in a normal match
			//draw the work fight
			draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT/2, c_black, c_white, "FIGHT", 16)
		}
	} else { //early starting
		//draw seconds til starting
		draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT/2, c_black, c_white, string(ceil(starting)), 16)
	}
	draw_set_font(fnt_pixel) //set font to small
	starting -= 1/GAME_SPEED //reduce starting by 1 a second
}

//------------------------DEBUG VALUE SPEW FOR DEBUGGING -----------------------------
if (global.debug and debug_mode) { //debug value spew
	draw_set_font(fnt_pixel_4) //draw set font
	//draw player position and state data, as well as match frame
	draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT/2, c_dkgray, c_lime, string(global.match_frame), 4)
	for (var i = 0; i < array_length_1d(state); i++) {
		if (instance_exists(player[i])) {
			draw_text_outlined(GUI_WIDTH*0.7, GUI_HEIGHT*0.1*(i+1), c_olive, c_fuchsia, string(state[i]), 4)	
			draw_text_outlined(GUI_WIDTH*0.8, GUI_HEIGHT*0.1*(i+1), c_olive, c_fuchsia, string(player[i].x), 4)	
			draw_text_outlined(GUI_WIDTH*0.9, GUI_HEIGHT*0.1*(i+1), c_olive, c_fuchsia, string(player[i].y), 4)
		}
	}
	draw_set_font(fnt_pixel_2)
	//draw the input array to screen
	for (var i = 0; i <= global.player_number; i++) {
		for (var o = 0; o < array_length_2d(input_array, i); o++) {
			draw_text_normal(i*50 + 50, o*15 + 50, input_array[i, o])
		}
	}
	//draw player position and state data, as well as match frame
	show_debug_message(string(global.match_frame))
	if ((alarm[0] > 0) and global.show_ui) {
		show_debug_message(_str)
	} else {
		show_debug_message("TIME")	
	}
	show_debug_message(input_array)
	show_debug_message(old_axis)
	for (var i = 0; i < array_length_1d(state); i++) {
		if (instance_exists(player[i])) {
			show_debug_message(string(i))
			show_debug_message(string(player[i].character))
			show_debug_message("state = " + string(state[i]))
			show_debug_message("x = " + string_format(player[i].x, 0, 8))	
			show_debug_message("y = " + string_format(player[i].y, 0, 8))
			show_debug_message("mom_x = " + string_format(player[i].momentum_x, 0, 8))	
			show_debug_message("mom_y = " + string_format(player[i].momentum_y, 0, 8))
			show_debug_message("xscl = " + string(player[i].image_xscale))
			show_debug_message("img = " + string(player[i].image_index))
			show_debug_message("spr = " + string(sprite_get_name(player[i].sprite_index)) + " (" + string(player[i].sprite_index) + ")")
			show_debug_message("alarm[0] = " + string(player[i].alarm[0]))
			show_debug_message("alarm[1] = " + string(player[i].alarm[1]))
			show_debug_message("alarm[2] = " + string(player[i].alarm[2]))
			show_debug_message("alarm[4] = " + string(player[i].alarm[4]))
			show_debug_message("alarm[7] = " + string(player[i].alarm[7]))
		}
	}
}
