/// @description animation effects on sprite

scr_check_special_instructions(0)

switch (obj_match_handler.state[player_number]) {
		//GROUNDED n/a
		case SPEED_UP: //transition to walk
			sprite_index = scr_get_sprite(id, "walk")
			obj_match_handler.state[player_number] = WALKING
			image_index = 0
		break;
		case SPEED_DOWN: case DASH_SLOW:
			sprite_index = scr_get_sprite(id, "idle")
			obj_match_handler.state[player_number] = GROUNDED
			image_index = 0
		break;
		case DASHING: //transition to run
			sprite_index = scr_get_sprite(id, "run")
			obj_match_handler.state[player_number] = RUNNING
			image_index = 0
		break;
		//WALKING n/a
		//RUNNING n/a
		//FREEFALL n/a
		case TILT_ATTACK: 
			if (string_pos("flurry", sprite_get_name(sprite_index)) > 0) { //if a flurry attack
				if (obj_input.input_array[player_number, ATTACK]) { //and holding attack still
					break; //dont execute further code, let the animation loop
				}	
			}
		case SMASH_ATTACK: case SPECIAL_ATTACK: case UNSHIELDING: case GRABBING:
			image_index = 0
			if (scr_check_for_ground()) { //if grounded
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
			} else { //airborne
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE	
			}
		break;
		case LEDGE:
			sprite_index = scr_get_sprite(id, "ledge_hold")
			image_index = 0
		break;
		case LEDGE_ALT:
			if (scr_check_for_ground()) {
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
			} else {
				with (obj_match_handler) {
					state[other.player_number] = scr_perform_freefall(other.id, other.player_number)	
				}
			}
		break;
		case LANDING:
			sprite_index = scr_get_sprite(id, "idle")
			obj_match_handler.state[player_number] = GROUNDED
		break;
		case DODGING:
			if (scr_check_for_ground()) {
				if (sprite_index = scr_get_sprite(id, "dodge")) {
					sprite_index = scr_get_sprite(id, "hold_shield")
					obj_match_handler.state[player_number] = SHIELDING
					with (instance_create(x, y, obj_shield)) { //with the shield object
						sprite_index = scr_get_sprite(other.id, "shield_ball") //give it its sprite
						creator = other.id //give it its assigned character
					}
				} else {
					sprite_index = scr_get_sprite(id, "idle")
					obj_match_handler.state[player_number] = GROUNDED
				}
			} else {
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE
			}
			image_index = 0
		break;
		case AIR_DODGING:
			sprite_index = scr_get_sprite(id, "air_move")
			obj_match_handler.state[player_number] = AIRBORNE
			momentum_x *= 0.5
			momentum_y *= 0.5
		break;
		case SHIELDING:
			sprite_index = scr_get_sprite(id, "hold_shield")
			image_index = 0
		break;
		//HIT_STUN
		//TECHING
		case JUMP_RISE: case JUMPING: case AIRBORNE:
			if (sprite_index = scr_get_sprite(id, "air_jump")) {
				sprite_index = scr_get_sprite(id, "air_move")
				image_index = 0
			}
		break;
		case AIR_ATTACK:
			sprite_index = scr_get_sprite(id, "air_move")
			obj_match_handler.state[player_number] = AIRBORNE
		break;
		//HOLDING
		case CROUCHING:
			image_index = 0
			if (sprite_index = scr_get_sprite(id, "crouch")) {
				sprite_index = scr_get_sprite(id, "crouch_hold")	
				bracing = 0.25
			} else if (sprite_index = scr_get_sprite(id, "crouch_end")) {
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
				bracing = 1
			}
		break;
}