/// @description animation effects on sprite

scr_check_special_instructions()

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
		case TILT_ATTACK: //transition to grounded state
			sprite_index = scr_get_sprite(id, "idle")
			obj_match_handler.state[player_number] = GROUNDED
		break;
		case SMASH_ATTACK: //transition to grounded state
			sprite_index = scr_get_sprite(id, "idle")
			obj_match_handler.state[player_number] = GROUNDED
		break;
		case SPECIAL_ATTACK:
			if (scr_check_for_ground()) { //if grounded
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
			} else { //airborne
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE	
			}
		break;
		//LEDGE 
		case LEDGE_ALT: //ledge jump and release is handled in special instructions
			sprite_index = scr_get_sprite(id, "idle")
			obj_match_handler.state[player_number] = GROUNDED
		break;
		case LANDING:
			sprite_index = scr_get_sprite(id, "idle")
			obj_match_handler.state[player_number] = GROUNDED
		break;
		case DODGING:
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
		case UNSHIELDING:
			if (scr_check_for_ground()) {
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
			} else {
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE
			}
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
		case GRABBING:
			image_index = 0
			if (scr_check_for_ground()) { //grounded
				sprite_index = scr_get_sprite(id, "idle")
				obj_match_handler.state[player_number] = GROUNDED
			} else { //put in freefall
				sprite_index = scr_get_sprite(id, "air_move")
				obj_match_handler.state[player_number] = AIRBORNE
			}
		break;
		//HOLDING
}