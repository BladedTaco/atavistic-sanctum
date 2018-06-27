/// @description check collisions
if (instance_exists(creator)) { 
	var _id = noone
	var c = false
	with (obj_hitbox) {
		if (creator = other.creator) {
			continue; //skip check if hitboxes are from the same creator or already been checked (this avoid double ups)
		}
		switch (rectangle_in_rectangle(bb[0], bb[1], bb[2], bb[3], other.bb[0], other.bb[1], other.bb[2], other.bb[3])) {
			case 0: c = false break; //not colliding at all
		
			case 1: //entirely contained, possible collision
			case 2: //intersection at edge, do test
				switch (other.shape) {
					case RECTANGLE:
						switch (shape) {
							case CIRCLE:
								//rectangle circle collision
								c = scr_cir_col_rec(id, other.id)
							break;
						
							case RECTANGLE:
								//rectangle rectangle collsion
								c = scr_rec_col_rec(id, other.id)
							break;
						}
					break;
				
					case CIRCLE:
						switch (shape) {
							case RECTANGLE:
								//circle rectangle collision
								c = scr_cir_col_rec(other.id, id)
							break;
						
							case CIRCLE:
								//circle circle collision
								c = scr_cir_col_cir(other.id, id)
							break;
						}
					break;
				}
			break;
		}
		if (c) {
			if (instance_exists(creator)) {
				if ((creator.object_index = obj_player) and (other.creator.object_index = obj_player)) {
					scr_handle_collision(id, other.id)
				} else {
					scr_handle_special_collision(id, other.id)
				}	
			}
		}
	}
}

instance_destroy(); //destroy self as all collisions for it have been found and dealt with