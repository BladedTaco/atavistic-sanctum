/// @description 
if (instance_exists(creator)) {
	creator.shield_percentage -= 5/GAME_SPEED
	if (creator.shield_percentage <= 0) {
		creator.shield_percentage = -creator.shield_max_percentage
		scr_apply_impulse(creator, creator.player_number, 90, _IMPULSE._SHIELD_BREAK/100, false)
		obj_match_handler.state[creator.player_number] = scr_perform_freefall(creator, creator.player_number)
		instance_destroy();
	}
	x = creator.x
	y = creator.y
	var _xx = 0
	var _yy = 0
	var _d = degtorad(-creator.image_angle)
	switch (creator.character) {
		case BAL:
			 _yy = -10
		break;
		case ETH:
			_yy = -15 
		break;
		case MAC: case GEO:
			_yy = -20
		break;
	}
	x += _xx*cos(_d) - _yy*sin(_d)
	y += _xx*sin(_d) + _yy*cos(_d)
	if (obj_match_handler.state[creator.player_number] != SHIELDING) {
		instance_destroy();	
	}
}