/// @description check collisions
var _id = noone
var c = false
col = true
with (obj_hitbox) {
	if ((creator = other.creator) or (col)) {
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
		scr_handle_collision(id, other.id)
	}
}
