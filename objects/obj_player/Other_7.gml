/// @description animation effects on sprite
if (instance_exists(obj_match_handler)) { //make sure match handler exists
	smash_charge = -1//reset smash charge
	if (scr_check_special_instructions(0)) { //check special instructions to see if code should be run
		switch (obj_match_handler.state[player_number]) { //based on state
			//GROUNDED n/a
			case SPEED_UP: //transition to walk animation
				sprite_index = scr_get_sprite(id, "walk")
				obj_match_handler.state[player_number] = WALKING
				image_index = 0
			break;
			case SPEED_DOWN: case DASH_SLOW: //transition to idle animation
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
				image_index = 0
			break;
			case DASHING: //transition to run animation
				sprite_index = scr_get_sprite(id, "run")
				obj_match_handler.state[player_number] = RUNNING
				image_index = 0
			break;
			//WALKING n/a
			//RUNNING n/a
			//FREEFALL n/a
			case TILT_ATTACK: case SMASH_ATTACK: case SPECIAL_ATTACK: case UNSHIELDING: case GRABBING: case TAUNTING:
				//transition into idle or air animation based on if there is ground
				image_index = 0
				if (scr_check_for_ground()) { //if grounded
					sprite_index = scr_get_sprite(id, "idle")
					obj_match_handler.state[player_number] = GROUNDED
				} else { //airborne
					sprite_index = scr_get_sprite(id, "air_move")
					obj_match_handler.state[player_number] = AIRBORNE	
				}
			break;
			case LEDGE: //tranisition to ledge hold animation
				sprite_index = scr_get_sprite(id, "ledge_hold")
				image_index = 0
			break;
			case LEDGE_ALT: //transition to idle or freefall animation based on the presence of ground
				if (scr_check_for_ground()) { //grounded
					//become idle
					sprite_index = scr_get_sprite(id, "idle")
					obj_match_handler.state[player_number] = GROUNDED
				} else { //airborne
					//perform freefall
					with (obj_match_handler) {
						state[other.player_number] = scr_perform_freefall(other.id, other.player_number)	
					}
				}
			break;
			case LANDING: //transition to idle animation
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
			break;
			case DODGING: //transition to new animation
				if (scr_check_for_ground()) { //if grounded
					if (sprite_index = scr_get_sprite(id, "dodge")) { //if dodging downwards
						//transition to shield animation and set state to shielding
						sprite_index = scr_get_sprite(id, "hold_shield")
						obj_match_handler.state[player_number] = SHIELDING
						with (instance_create(x, y, obj_shield)) { //with the shield object
							sprite_index = scr_get_sprite(other.id, "shield_ball") //give it its sprite
							creator = other.id //give it its assigned character
						}
					} else { //rolling
						//transition to idle animation
						sprite_index = scr_get_sprite(id, "idle")
						obj_match_handler.state[player_number] = GROUNDED
					}
				} else { //airborne
					//transition to air move animation
					sprite_index = scr_get_sprite(id, "air_move")
					obj_match_handler.state[player_number] = AIRBORNE
				}
				image_index = 0 //reset image index
			break;
			case AIR_DODGING: //transition to air move animation and halve momentum
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE
				momentum_x *= 0.5
				momentum_y *= 0.5
			break;
			case SHIELDING: //if not GEO character, transition to hold shield animation
				if (character != GEO) {
					sprite_index = scr_get_sprite(id, "hold_shield")
					image_index = 0
				}
			break;
			//HIT_STUN
			//TECHING
			case JUMP_RISE: case JUMPING: case AIRBORNE: 
				if (character != MAC) { //able to air jump
					//transition to air move animation if air jumping
					if (sprite_index = scr_get_sprite(id, "air_jump")) {
						sprite_index = scr_get_sprite(id, "air_move")
						image_index = 0
					}
				}
				//if jumping from ground, transition to air move animation
				if (sprite_index = scr_get_sprite(id, "jump")) {
					sprite_index = scr_get_sprite(id, "air_move") //set animation to air move animation
					image_index = 0 //set animation frame to the first one	
				}
			break;
			case AIR_ATTACK: //transition to air move animation
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE
			break;
			case HOLDING:
				//if special grab object, check for termination of code execution
				if ((character = ETH) and instance_exists(child_object)) {
					if (child_object.state != 3) {
						break;	
					}
				} 
				//if ending a throw, transition to either idle or air animation
				if ((sprite_index != scr_get_sprite(id, "grab_hold")) and (sprite_index != scr_get_sprite(id, "grab_jab"))) {
					//if ending a throw
					image_index = 0
					if (scr_check_for_ground()) { //if grounded
						sprite_index = scr_get_sprite(id, "idle")
						obj_match_handler.state[player_number] = GROUNDED
					} else { //airborne
						sprite_index = scr_get_sprite(id, "air_move")
						obj_match_handler.state[player_number] = AIRBORNE	
					}
				} else { //finsihing a grab jab or hold
					//set to grab animation
					image_index = 0
					sprite_index = scr_get_sprite(id, "grab_hold")
				}
			break;
			case CROUCHING:
				image_index = 0
				if (sprite_index = scr_get_sprite(id, "crouch")) { //if starting crouch
					//transition to holding crouch animation
					sprite_index = scr_get_sprite(id, "crouch_hold")	
					bracing = 0.25
				} else if (sprite_index = scr_get_sprite(id, "crouch_end")) { //if ending crouch
					//transition to idle animation
					sprite_index = scr_get_sprite(id, "idle")
					obj_match_handler.state[player_number] = GROUNDED
					bracing = 1
				}
			break;
		}
	}
}
