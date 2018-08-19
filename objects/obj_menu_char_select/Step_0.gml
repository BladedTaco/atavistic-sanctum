/// @description control menu
if (room = rm_menu) {
	if (!active) {
		if (x < 0) {
			x += GUI_WIDTH/15
			if (x >= 0) {
				x = 0
				active = true
			}
		}
	} else {
		while (player_number < global.player_number) { //check if a new player should be initialised
			if (player_number < 7) {
				cursor_x[player_number] = x + GUI_WIDTH*((player_number + 0.5)/(player_number + 2)) //the x position of the player cursor
			} else {
				cursor_x[player_number] = x + GUI_WIDTH*(15/16) //the x position of the player cursor
			}
			cursor_y[player_number] = y + GUI_HEIGHT*0.8 //the y position of the player cursor
			character[player_number] = -1 //the character selected
			pal_sprite[player_number] = pal_bal //the pallet swap sprite
			pallet[player_number] = -1 //pallet for the character selected
			sprite[player_number] = -1 //sprite for the character selected
			name[player_number] = "P" + string(player_number+1)
			player_col[player_number] = make_colour_hsv((player_number*255)/8, 255, 255) //variable for player colour
			col[player_number] = 0 //variable for collision found	
			player_number += 1
			if (instance_exists(obj_menu_name)) {
				with (obj_menu_name) {
					player_number += 1;
					if (surface_exists(clip_surface)) {
						surface_free(clip_surface)
					}
				}
			}
		}
		player_number = global.player_number //player_number is set to the global equivalent
		for (var i = 0; i < player_number; i++) { //for each menu user
			if (sub_menu[i]) { continue } //do not execute code for player if the player is in a sub menu
			cursor_x[i] = clamp(cursor_x[i] + round(obj_input.input_array[i, XAXIS]*5), 0, GUI_WIDTH)
			cursor_y[i] = clamp(cursor_y[i] + round(obj_input.input_array[i, YAXIS]*5), 0, GUI_HEIGHT)
			//check based on vertical position, then horizontal position
			col[i] = 0 //intitialise as no collision
			if (cursor_y[i] < 50) { //stock or time
				if ((cursor_x[i] > GUI_WIDTH*0.05) and (cursor_x[i] < GUI_WIDTH*0.35)) {
					col[i] = 1 //selecting stock
				}
				if ((cursor_x[i] > GUI_WIDTH*0.6) and (cursor_x[i] < GUI_WIDTH*0.93)) {
					col[i] = 2 //selecting time
				}
			} else if (cursor_y[i] < GUI_HEIGHT*0.5 - 100) { //random character
				col[i] = 3 //random character regardless of x position
			} else if (cursor_y[i] < GUI_HEIGHT*0.5) { //base character
				if ((cursor_x[i] > GUI_WIDTH*0.125 - 75) and (cursor_x[i] < GUI_WIDTH*0.125 + 75)) {
					col[i] = 4 //selecting BALLOONY	
				} else if ((cursor_x[i] > GUI_WIDTH*0.375 - 75) and (cursor_x[i] < GUI_WIDTH*0.375 + 75)) {
					col[i] = 5 //selecting MACHINATION
				} else if ((cursor_x[i] > GUI_WIDTH*0.625 - 75) and (cursor_x[i] < GUI_WIDTH*0.625 + 75)) {
					col[i] = 6 //selecting GEOS	
				} else if ((cursor_x[i] > GUI_WIDTH*0.875 - 75) and (cursor_x[i] < GUI_WIDTH*0.875 + 75)) {
					col[i] = 7 //selecting ETHEREAL SPIRIT	
				} else {
					col[i] = 3 //random character	
				}
			} else if (cursor_y[i] < GUI_HEIGHT*0.5 + 20) { //colour pallet
				switch (floor((cursor_x[i] mod (GUI_WIDTH*0.25))/20)) {
					case 0: case 11: 
						col[i] = 3 //random character
					break;
					default:
						col[i] = 10 + floor((cursor_x[i] mod (GUI_WIDTH*0.25))/20)
						pal[cursor_x[i] div (GUI_WIDTH*0.25)] = floor((cursor_x[i] mod (GUI_WIDTH*0.25))/20) - 1
					break;
				}
			} else if (cursor_y[i] < GUI_HEIGHT*0.75) { //random character
				col[i] = 3 //random character regardless of x position
			} else if ((cursor_x[i] > GUI_WIDTH*(i/min(player_number + 1, 8))) and (cursor_x[i] < GUI_WIDTH*((i + 1)/min(player_number + 1, 8)))) { //selecing character card
				if (cursor_y[i] < GUI_HEIGHT*0.85) { //portrait click, colour pallet cycle
					col[i] = 8 //cycle colour pallet
				} else if (cursor_y[i] < GUI_HEIGHT*0.925) { //unassign
					col[i] = 9 //unassign player
				} else { //change name
					col[i] = 10 //change player name
				}
			}
		
			if (obj_input.input_array[i, ATTACK] and !obj_input.sticky_attack[i]) { //selecting item from menu
				obj_input.sticky_attack[i] = true //set sticky attack to true
				switch (col[i]) {
					case 0: break; //nothing 
					case 1: //stock
						if (cursor_y[i] < 25) {
							stocks += 1
						} else {
							stocks = max(stocks - 1, 0)	
						}
					break;
					case 2: //time
						if (cursor_y[i] < 25) {
							time += 1
						} else {
							time = max(time - 1, 0)	
						}
					break;
					case 3: //random character
						cursor_y[i] = GUI_HEIGHT/2 - 50 //set cursor position on the character select sprite
						cursor_x[i] = GUI_WIDTH*0.25*irandom(3) + GUI_WIDTH*0.125 //set random x position on a character
						obj_input.sticky_attack[i] = false
					break;
					case 4: //BAL
						character[i] = BAL;
						pal_sprite[i] = pal_bal 
						sprite[i] = spr_bal_stock
						pallet[i] = pal[BAL]
						//make sure pallet is unique
						while (!scr_unique_pallet(i, BAL, pallet[i])) {
							pallet[i] = (pallet[i] + 1) mod 11
						}
					break; 
					case 5: //MAC
						character[i] = MAC;
						pal_sprite[i] = pal_mac 
						sprite[i] = spr_mac_stock
						pallet[i] = pal[MAC]
						//make sure pallet is unique
						while (!scr_unique_pallet(i, MAC, pallet[i])) {
							pallet[i] = (pallet[i] + 1) mod 11
						}
					break; 
					case 6: //GEO
						character[i] = GEO;
						pal_sprite[i] = pal_geo 
						sprite[i] = spr_geo_stock
						pallet[i] = pal[GEO]
						//make sure pallet is unique
						while (!scr_unique_pallet(i, GEO, pallet[i])) {
							pallet[i] = (pallet[i] + 1) mod 11
						}
					break; 
					case 7: //ETH
						character[i] = ETH;
						pal_sprite[i] = pal_eth 
						sprite[i] = spr_eth_stock
						pallet[i] = pal[ETH]
						//make sure pallet is unique
						while (!scr_unique_pallet(i, ETH, pallet[i])) {
							pallet[i] = (pallet[i] + 1) mod 11
						}					
					break; 
					case 8: //cycle colour pallet
						do { //cycle until a unique pallet found
							pallet[i] = (pallet[i] + 1) mod 11
						} until (scr_unique_pallet(i, character[i], pallet[i]))
					break;
					case 9: //unassign player
						player_number -= 1 //reduce player number
						global.player_number -= 1 //reduce global player number
						for (var o = i; o < player_number; o++) { 
							scr_move_player(o + 1, o) //move all players down a spot
						}
						if (instance_exists(obj_menu_name)) {
							with (obj_menu_name) {
								if (player > i) {
									player -= 1;
								}
								player_number -= 1;
								//free all name clip surfaces so they automatically resize
								if (surface_exists(clip_surface)) {
									surface_free(clip_surface)
								}
							}
						}
						i -= 1 //decrement i so that the next player executes this steps code
						obj_input.alarm[1] = GAME_SPEED*0.25 //stop controller from reconnecting instantly
						continue;
					break;
					case 10://change player name
						sub_menu[i] = true;
						with (instance_create(GUI_WIDTH*((i + 0.5)/(player_number + 1)), GUI_HEIGHT, obj_menu_name)) {
							player = i
							player_number = other.player_number
							name = other.name[i]
							depth = other.depth - 1
						}
					break; 
					default: //choosing a colour pallet
						if (scr_unique_pallet(i, floor(cursor_x[i]/(GUI_WIDTH*0.25)), col[i] - 11)) {
							pallet[i] = col[i] - 11 //set colour pallet
							cursor_x[i] += (5 - pallet[i])*20
							cursor_y[i] = GUI_HEIGHT/2 - 50
							obj_input.sticky_attack[i] = false
						}
					break;
				}
			}
			if (obj_input.input_array[i, SPECIAL]) { //exiting menu
				alarm[0] += 2
				if (alarm[0] > GAME_SPEED) { //button held for long enough, exit menu
					with(instance_create(-GUI_WIDTH, 0, obj_menu_main)) {
						menu_index = 0	
						alarm[0] = MENU_DELAY
						alarm[1] = -1
					}
					alarm[0] = MENU_DELAY
					active = false
					if (instance_exists(obj_menu_name)) { //destroy any name menus
						with (obj_menu_name) {
							instance_destroy();	
						}
					}
					instance_destroy();
					scr_reset_players(); //reset players
				}
			}
			if (alarm[0] <= 0) { //dont alllow starting match if exiting menu
				if (obj_input.input_array[i, PAUSE] and !obj_input.sticky_pause[i]) {
					obj_input.sticky_pause[i] = true
					for (var o = 0; o < player_number; o++) {
						if (character[o] < 0) { //character not selected
							o = -1
							break;
						}
					}
					if (o > 1) { //if all players have a character selected and there are 2 players or more
						active = false;
						with (instance_create(0, GUI_HEIGHT, obj_menu_stage_select)) {
							depth = other.depth - 1	
						}
						break;
					}
				}
			} else {
				//sticky pause somehow gets stuck on a forfeit from a match
				//this code prevents that from happening.
				if (!obj_input.input_array[i, PAUSE]) {
					obj_input.sticky_pause[i] = false
				}
			}
		}
		if (alarm[0] > 0) {
			y = ((alarm[0]*alarm[0])/(GAME_SPEED*GAME_SPEED))*GUI_HEIGHT
		} else {
			y = 0	
		}
	}
} else {
	if (!instance_exists(obj_match_handler)) {
		scr_start_match(true) //create the players
	}
	alarm[0] += 2
	y = ((alarm[0]*alarm[0])/(GAME_SPEED*GAME_SPEED))*GUI_HEIGHT
	if (alarm[0] > GAME_SPEED) {
		instance_deactivate_object(obj_menu_char_select);	
	}
}