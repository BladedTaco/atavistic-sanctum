/// @description check collisions
var _id = noone
with (obj_hitbox) {
	switch (rectangle_in_rectangle(bb[0], bb[1], bb[2], bb[3], other.bb[0], other.bb[1], other.bb[2], other.bb[3])) {
		case 0: other.col = 0 break; //not colliding at all
		
		case 1: //entirely contained, return true
			other.col = 1
		break;
		
		case 2: //intersection at edge, do test
			switch (other.shape) {
				case RECTANGLE:
					switch (shape) {
						case CIRCLE:
							//rectangle circle collision
							other.col = scr_col_cir_rec(id, other.id)
						break;
						
						case RECTANGLE:
							other.col = scr_rec_col_rec(id, other.id)
							_id = id
						break;
					}
				break;
				
				case CIRCLE:
					switch (shape) {
						case RECTANGLE:
							_id = id
							other.col = scr_col_cir_rec(other.id, id)
						break;
					}
				break;
			}
		
		break;
	
	}
	
}

if (shape = CIRCLE) {
	if (!colled) {
		global.coll[col] += 1
		colled = true
		//do expensive collision check
		/*
		if (instance_exists(_id) and (col = 6)) {
			for (var i = bb[0]; i <= bb[2]; i++) {
				for (var o = bb[1]; o <= bb[3]; o++) {
					if (scr_point_in_rec(i, o, _id)) { 
						if (scr_point_in_cir(i, o, id)) {
							if (col = 6) {
								global.coll[7] += 1	
								save = true
								
								exit
							}
						}
					}
				}
			}
		}
		*/
	}
}