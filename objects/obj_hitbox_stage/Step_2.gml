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
				var _inst = other.creator
				with (creator) {
					if (inertial and (obj_match_handler.state[player_number] = FREEFALL) and !spawning) { //if colliding into ground
						scr_momentum_delay(id, momentum_x, momentum_y, 1, false) //delay momentum
						//check for y difference
						switch(round((point_direction(x, y, _inst.x, _inst.y) - _inst.image_angle)/45) mod 8) {
							case 0: //moving right
								sprite_index = scr_get_sprite(id, "hurt_side")	
							break;
							case 4: //moving left
								sprite_index = scr_get_sprite(id, "hurt_side")
							break;
							case 1: case 2: case 3: //moving down
								sprite_index = scr_get_sprite(id, "hurt_down")
							break;
							case 5: case 6: case 7: //moving up
								sprite_index = scr_get_sprite(id, "hurt_up")
							break;
						}
						var _xx = other.x - momentum_x*2
						var _yy = other.y - momentum_y*2
						if (_inst.image_angle != 0) { //complex check, rotated ground
							for (var i = 0; i <= 3; i++) {
								if (sign((_xx - _id._x[i])*(_id._y[(i+1) mod 4] - _id._y[i]) - 
								(_yy - _id._y[i])*(_id._x[(i+1) mod 4] - _id._x[i])) != _id.side[i]) { //outside line
									var _l = point_distance(0, 0, momentum_x, momentum_y)
									var _d = point_direction(0, 0, momentum_x, momentum_y)
									var _d2 = (point_direction(_id._x[i], _id._y[i], _id._x[(i+1) mod 4], _id._y[(i+1) mod 4]) + 90) mod 360
									_d = _d2 - _d
									_d = _d + _d2
									momentum_x = lengthdir_x(_l, _d)
									momentum_y = lengthdir_y(_l, _d)
								}
							}
						} else { //simple check, unrotated
							if (_yy < _inst.bbox_top) { //above ground moving down
								sprite_index = scr_get_sprite(id, "hurt_down")
								momentum_y *= -0.8
							} else if (_yy > _inst.bbox_bottom) { //below ground moving up
								sprite_index = scr_get_sprite(id, "hurt_up")
								momentum_y *= -0.8
							} else { //to the side of the ground
								sprite_index = scr_get_sprite(id, "hurt_side")
							}
							//check for x difference
							if (_xx > _inst.bbox_right) { //right of ground moving left
								momentum_x *= -0.8
							} else if (_xx < _inst.bbox_left) { //left of ground moving right
								momentum_x *= -0.8
							}
						}
					}
				}
			break;
		}
	}
}
