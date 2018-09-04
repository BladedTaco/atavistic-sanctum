/// @description 
if !(dead) { //if alive
	if (spawning) { //if spawning
		image_alpha = min(image_alpha + (0.35/GAME_SPEED), 1) //set transparency
		if (instance_exists(obj_menu_training)) { //if training
			percentage = lerp(floor(percentage), obj_menu_training.percentage, 0.04) //lerp percentage to target
		} else { //in a match
			percentage = lerp(floor(percentage), 0, 0.04) //lerp percentage to 0
		}
		shield_percentage = lerp(ceil(shield_percentage), shield_max_percentage, 0.04) //lerp shield percentage to max
		if (draw_count >= GAME_SPEED*3) { //if alive for more than 3 seconds
			spawning = false //set spawining o false
		}
	}


	draw_count++ //increment draw_count
	shield_percentage = min(shield_percentage + 2/GAME_SPEED, shield_max_percentage) //refresh shield

	//reset effective position
	effective_x = 0
	effective_y = 0
	scr_check_special_instructions(1) //check for special instructions

	//move
	var l = 100 //set loop exiter to max
	//if in a non ledge state and animating
	if ((obj_match_handler.state[player_number] != LEDGE_ALT) and (obj_match_handler.state[player_number] != LEDGE) and (image_speed != 0)) {
		var j = max(round(2*point_distance(0, 0, momentum_x, momentum_y)/GROUND_HEIGHT), 1) //set movement increment
		//set local variables
		var _ex = effective_x
		var _ey = effective_y
		var _mx = momentum_x
		var _my = momentum_y
		repeat(j) { //repeat movement increment times
			l = 100 //set loop exiter to max
			if (inertial) { //if not in hitstun
				//move by momentum/repeat number
				x += _mx/j
				y += _my/j
			}
			//check for the ground
			while (instance_place(x, y+1, obj_ground) or instance_position(x + _ex, y+1 + _ey, obj_ground)) { //while in the ground
				l-- //reduce loop exiter
				var _inst = instance_place(x, y+1, obj_ground) //get ground instance
				if !(instance_exists(_inst)) { //if no instance found with sprite mask
					_inst = instance_position(x + _ey, y+1 + _ey, obj_ground) //check for one at coordinates
				} else { //ground exists
					//set image angle to  the same as the grounds
					var _img_angle = image_angle
					image_angle = _inst.image_angle
					if (instance_place(x, y+1, obj_ground) = noone) { //if no longer in the ground
						_inst = noone //remove instance
					} else { //still in the ground
						image_angle = _img_angle //return to staning up at previous angle
					}
				}
				if (instance_exists(_inst)) { //if there is an instance of a ground object to check against
					scr_helpless_bounce(_inst, _inst.hitbox, id) //perform helpless bounce
					//get direction
					var _d = point_direction(_inst.x, _inst.y, x + _ex - (momentum_x/j), y + _ey - (momentum_y/j))
					if (((angle_difference(_inst.diag1, _d) > 0) and (angle_difference(_inst.diag2, _d) < 0)) 
					or ((angle_difference(_inst.diag3, _d) > 0) and (angle_difference(_inst.diag4, _d) < 0))) { //above or below
						if (angle_difference(_inst.image_angle, _d) < 0) { //above
							_my = 0 //stop vertical movement while keeping momentum
							_mx = 0 //stop horizontal movement while keeping momentum
							break; //handled elsewhere
						} else { //below
							_d = image_angle - 90
						}
					} else { //left or right of the ground
						if (angle_difference(_inst.image_angle + 90, _d) < 0) { //left
							_d = image_angle + 180
						} else { //right
							_d = image_angle 
						}
					}
					while (instance_place(x, y+1, _inst) or instance_position(x + _ex, y+1 + _ey, _inst)) { //while in the instance
						l-- //reduce loop exiter
						//move
						x += lengthdir_x(0.25, _d)
						y += lengthdir_y(0.25, _d)
						if (l <= 0) { break; } //if loop exiter is done, exit loop
					}
				} else { break; } //if no instance found, break
				if (l <= 0) { break; } //if loop exiter is done, exit loop
			}
			//check for platform
			if (instance_place(x, y+1, obj_platform) or instance_position(x + _ex, y+1 + _ey, obj_platform)) {
				var _inst = instance_place(x, y+1, obj_platform)
				if !(instance_exists(_inst)) { //if no instance found with sprite mask
					_inst = instance_position(x + _ex, y+1 + _ey, obj_platform) //check for one at coordinates
				}
				if (instance_exists(_inst)) { //if there is an instance of a ground object to check against
					//get a previous position					
					var _xx = x - momentum_x*2
					var _yy = y - momentum_y*2
					var _id = _inst.hitbox //get the id of the hitbox of the ground object
					if (sign((_xx - _id._x[0])*(_id._y[1] - _id._y[0]) - 
					(_yy - _id._y[0])*(_id._x[1] - _id._x[0])) != _id.side[0]) { //above top line of hitbox
						scr_helpless_bounce(_inst, _inst.hitbox, id) //perform helpless bounce
					}
				}
			}	
			if (j <= 0) { break; } //if no movement increments, exit loop
		}
	}

	if (l <= 0) { //check if still in ground after exceeding loop limit above
		l = 100 //set loop limiter to max
		while (instance_place(x, y+1, _inst)*l > 0) { //while in the ground instance
			y -= 1 //move up
			l-- //decrease loop limiter
		}
	}


	//get previous x values
	last_x2 = last_x
	last_x = xprevious
	last_y2 = last_y
	last_y = yprevious
} else { //if dead
	//dont was resources animating
	image_index = 0
	image_speed = 0
}
