///@func scr_test_collision(_id, _id2)
///@param _id - one of the two hitbox objects to test for collision
///@param _id2 - the other hitbox object to test for collision
///@desc tests the given hitboxes for collision with each other

//this nested with is used so that the other keyword can be used instead of storing a variable to hold the id
var c = false
with (argument[0]) { //with one hitbox
	with (argument[1]) { ///with the other hitbox
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
	}
}

return c