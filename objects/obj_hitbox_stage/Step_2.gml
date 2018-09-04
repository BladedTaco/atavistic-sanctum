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
							//rectangle-circle collision
							c = scr_cir_col_rec(id, other.id)
						break;
						
						case RECTANGLE:
							//rectangle-rectangle collision
							c = scr_rec_col_rec(id, other.id)
						break;
					}
				break;
				
				case CIRCLE:
					switch (shape) {
						case RECTANGLE:
							//rectangle-circle collision
							c = scr_cir_col_rec(other.id, id)
						break;
						
						case CIRCLE:
							//circle-circle collision
							c = scr_cir_col_cir(other.id, id)
						break;
					}
				break;
			}
		
		break;
	
	}
	
	//collide
	if (c and instance_exists(creator)) { //if colliding and there is a creator for the hitbox
		switch (creator.object_index) {
			case obj_player: //owned by player
				switch (other.creator.object_index) {
					case obj_ledge: //colliding with ledge hitbox
						switch (obj_match_handler.state[creator.player_number]) {
							//grab onto ledge if able to
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
			break;
			
			case obj_mac_projectile: //projectile
				//destroy projectile if not colliding with platform or ledge
				if ((other.creator.object_index != obj_ledge) and (other.creator.object_index != obj_platform)) {
					instance_destroy(creator);
				}
			break;
		}
	}
}
