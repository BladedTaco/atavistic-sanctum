/// @description 
if (instance_exists(creator)) {
	x = creator.x
	y = creator.y
	switch (creator.character) {
		case BAL: case GEO: case MAC: case ETH:
			 y -= 10
		break;
	}
	if (obj_match_handler.state[creator.player_number] != SHIELDING) {
		instance_destroy();	
	}
}