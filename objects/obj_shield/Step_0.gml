/// @description 
if (instance_exists(creator)) {
	x = creator.x
	y = creator.y
	var _xx = 0
	var _yy = 0
	var _d = degtorad(-creator.image_angle)
	switch (creator.character) {
		case BAL: case GEO: case ETH:
			 _yy = -10
		break;
		case MAC:
			_yy = -20
		break;
	}
	x += _xx*cos(_d) - _yy*sin(_d)
	y += _xx*sin(_d) + _yy*cos(_d)
	if (obj_match_handler.state[creator.player_number] != SHIELDING) {
		instance_destroy();	
	}
}