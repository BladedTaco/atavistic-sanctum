/// @description check collisions
var _id = noone
var c = false
col = false
with (obj_hitbox) {
	if (creator = other.creator) {
		continue; //if hitboxes are from the same creator
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
	/* handle collision here
	collide
	collide
	*/
	if (c) {
		other.col = true
	}
}
