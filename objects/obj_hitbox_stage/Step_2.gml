/// @description check collisions
var _id = id
var c = false
col = false
with (obj_hitbox) {
	if (hitbox) { //skip hitboxes, only check for hurtboxes
		continue; //skip this collision check
	}
	switch (rectangle_in_rectangle(bb[0], bb[1], bb[2], bb[3], other.bb[0], other.bb[1], other.bb[2], other.bb[3])) {
		case 0: c = false break; //not colliding at all
		
		case 1: //entirely contained, possible collision
		case 2: //intersection at edge, do test
			switch (other.shape) {
				case RECTANGLE:
					switch (shape) {
						case CIRCLE:
							c = scr_cir_col_rec(id, other.id)
						break;
						
						case RECTANGLE:
							c = scr_rec_col_rec(id, other.id)
						break;
					}
				break;
				
				case CIRCLE:
					switch (shape) {
						case RECTANGLE:
							c = scr_cir_col_rec(other.id, id)
						break;
						
						case CIRCLE:
							c = scr_cir_col_cir(other.id, id)
						break;
					}
				break;
			}
		
		break;
	
	}
	
	//collide
	if (c) {
		switch (other.creator.object_index) {
			case obj_ledge:
				switch (obj_match_handler.state[creator.player_number]) {
					case AIRBORNE: case JUMP_RISE: case FREEFALL:
						with (obj_match_handler) {
							state[other.creator.player_number] = scr_perform_ledge(other.creator, other.creator.player_number, 0)	
						}
					break;
				}
			break;
			
			case obj_ground:
				//scr_helpless_bounce(other.creator, id, creator)
			break;
		}
	}
}