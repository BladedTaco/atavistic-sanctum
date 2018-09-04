/// @description shield the player
if (instance_exists(creator)) { //if there is a player to shield
	creator.shield_percentage -= 5/GAME_SPEED //reduce their shield meter
	if (creator.shield_percentage <= 0) { //if shield meter empty
		//cause a shield break
		//make meter negative, apply vertical force, and set into freefall
		creator.shield_percentage = -creator.shield_max_percentage
		scr_apply_impulse(creator, creator.player_number, 90, _IMPULSE._SHIELD_BREAK/100, false)
		obj_match_handler.state[creator.player_number] = scr_perform_freefall(creator, creator.player_number)
		instance_destroy(); //destroy self
	}
	//move to creators position
	x = creator.x
	y = creator.y
	var _xx = 0
	var _yy = 0
	var _d = degtorad(-creator.image_angle)
	//get position offset based on character
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
	//rotate this offset by the players angle around the non offset position
	x += _xx*cos(_d) - _yy*sin(_d)
	y += _xx*sin(_d) + _yy*cos(_d)
	if (obj_match_handler.state[creator.player_number] != SHIELDING) { //if player is no longer shielding
		instance_destroy();	//destroy self
	}
}