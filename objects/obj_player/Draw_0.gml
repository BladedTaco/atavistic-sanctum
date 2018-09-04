///@desc draw effects
if (!dead and instance_exists(obj_match_handler)) { //if alive and during match
	if (surface_exists(pal_surface) and surface_exists(obj_match_handler.pal_surface)) { //if pallet surfaces exist
		//check for outline colour changes
		surface_set_target(pal_surface) //set draw target and reset it to base state
		surface_copy_part(pal_surface, 1, 0, obj_match_handler.pal_surface, player_number, 0, 1, 16)

		if (alarm[2] >= 0) { //smash charge flash
			if (floor(image_index) = smash_frame) { //if on the smash attack frame
				if (round(draw_count/6) mod 2 = 0) { //every 1/3 of a second for 1/6 of a second
					draw_point_colour(1, 0, c_yellow) //make the characters outline yellow
				}
			}
		}
		if (alarm[5] >= 0) { //grab colour fade
			//fade outline colour to show grab time remaining
			draw_point_colour(1, 0, merge_colour(c_black, c_white, alarm[5]/(GAME_SPEED*5)))
		}
		if (alarm[0] >= 0) { //ledge colour fade
			if (obj_match_handler.state[player_number] = LEDGE) { //if on the ledge
				//fade outline colour to show ledge time remaining
				draw_point_colour(1, 0, merge_colour(c_black, c_white, alarm[0]/(GAME_SPEED*3)))
			}
		}
	
		if ((obj_match_handler.state[player_number] = HIT_STUN) or (obj_match_handler.state[player_number] = TECHING)) { //check if the player will likely die from the attack
			//define variables
			var _px = x
			var _py = y
			var _col = false
			var _mx = momentum_x
			var _my = momentum_y
			var _l = point_distance(0, 0, _mx, _my)
			var _id, _d2, _d, _inst
			//move test position by momentum 5 times
			for (var i = 0; i < 10; i++) {
				_d2 = -1;
				_inst = collision_line(_px, _py, _px + _mx, _py + _my, obj_ground, true, false) 
				//if there is no ground between last test position and new test position
				if (!instance_exists(_inst)) {
					//move the test point by momentum
					_px += _mx 
					_py += _my
				} else { //else there is ground to bounce off of
					//get the direction of the line to bounce off of
					_id = _inst.hitbox
					for (var o = 0; o < 4; o++) {
						if (sign((_px - _id._x[o])*(_id._y[(o+1) mod 4] - _id._y[o]) - 
						(_py - _id._y[o])*(_id._x[(o+1) mod 4] - _id._x[o])) != _id.side[o]) { //outside line
							if (_d2 = -1) { //angle not set yet, so just get angle of line to bounce off
								_d2 = (point_direction(_id._x[o], _id._y[o], _id._x[(o+1) mod 4], _id._y[(o+1) mod 4]) + 90) mod 360
							} else { //get the average angle of the walls, which should end up in a straight reverse bounce
								_d2 = (_d2 + ((point_direction(_id._x[o], _id._y[o], _id._x[(o+1) mod 4], _id._y[(o+1) mod 4]) + 90) mod 360))/2
							}
						}
					}
					//get the direction for momentum
					_d = point_direction(_mx, _my, 0, 0)
					_d = _d2 - _d
					_d = _d + _d2
					_mx = lengthdir_x(_l, _d)
					_my = lengthdir_y(_l, _d)
					//apply momentum to test position
					_px += _mx
					_py += _my
				}
				//if outside of blastzone
				if (!position_meeting(_px, _py, obj_blast_zone)) {
					//set _col to true and stop loop
					_col = true
					i = 100
				}
			}
		
			if (_col) { //if likely to die from attack
				//apply effect
				draw_set_alpha(0.75)
				if (draw_count mod 10 < 5) {
					draw_set_colour(c_white)
				} else {
					draw_set_colour(c_black)
				}
				draw_line(1, 0, 1, 16)
				draw_set_alpha(1)	
			}
		}

		surface_reset_target() //reset drawing target
	}

	image_blend = img_blend //set image blend
	pal_swap_set(pal_surface, 1, true) //set pallet swap

	if (character = ETH) { //if ETH character
		//draw a traling image effect
		draw_sprite_ext(sprite_index, image_index - 2, last_x2, last_y2, image_xscale, image_yscale, image_angle, c_gray, 0.25)
		draw_sprite_ext(sprite_index, image_index - 1, last_x, last_y, image_xscale, image_yscale, image_angle, c_ltgray, 0.5)
	}


	switch (obj_match_handler.state[player_number]) { //based on state
		case AIR_DODGING: 
			image_blend = c_gray //blend character gray when air dodging
		break;
		case FREEFALL:
			//make image blend a triangle wave transition between a dark colour and a light colour
			image_blend = merge_colour($8f8f8f, $fafafa, scr_triangle_wave(0.5, GAME_SPEED/2, 0, -0.5, draw_count))
		break;
	}

	draw_self(); //draw the sprite
	pal_swap_reset() //reset pallet swap

	if (!point_in_rectangle(x + effective_x, y + effective_y, 0, 0, room_width, room_height)) { //if not in room boundary, draw bubble
		//get position
		var _xx = clamp(x + effective_x, 10, room_width - 10)
		var _yy = clamp(y + effective_y, 30, room_height + 5)
		//draw background circle
		draw_circle_colour(_xx, _yy - 20, 20, player_col, merge_colour(player_col, c_black, 0.85), false)
		pal_swap_set(pal_surface, 1, true) //set pallet swap
		//get positions and area
		var _d = degtorad(image_angle)
		var _e_x = effective_x*cos(_d) - effective_y*sin(_d)
		var _e_y = effective_x*sin(_d) + effective_y*cos(_d)
		var _xx2 = sprite_get_xoffset(sprite_index) + _e_x - 20
		var _yy2 = sprite_get_yoffset(sprite_index) + _e_y - 60
		//draw sprite in bubble and reset pallet swap
		draw_sprite_part_ext(sprite_index, image_index, _xx2, _yy2, 40, 66, _xx - 10 + (20)*(image_xscale == -1), _yy - 37, 0.5*image_xscale, 0.5, image_blend, image_alpha)
		pal_swap_reset();
		global.player_outside = true //set the flag to say that a player it outside the room bounds
	}


	if (global.debug) { //if debug mode
		//draw an aqua line showing momentum
		draw_set_colour(c_aqua)
		draw_line(x, y, x + momentum_x, y + momentum_y)
		//draw a lime circle at effective position
		draw_set_colour(c_lime)
		draw_circle(x + effective_x, y + effective_y, 2, false)
		//draw an orange line at effective position showing momentum
		draw_set_colour(c_orange)
		draw_line(x + effective_x, y + effective_y, x + effective_x + momentum_x, y + effective_y + momentum_y)
		//draw an olive circle at position but clamped to room boundaries
		draw_set_colour(c_olive)
		draw_circle(clamp(x, 0, room_width), clamp(y, 0, room_height), 3, false)
	}
}
