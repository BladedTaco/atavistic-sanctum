///@func scr_perform_attack(object, player_number, attack_type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param attack_type - whether the attack is neutral, tilt, smash, special, dash, or aerial (0 1 2 3 4 5 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform an attack
var _type, _direction, _sprite

if (input_array[argument[1], TILT] = NEUTRAL_MOVE) { //neutral attack
	_direction = "neutral"
} else {
	switch (round(argument[3]/90)) { //get direction
		case 0: //right
		case 4: //right
			if (sign(argument[0].image_xscale) = 1) { //facing right
				_direction = "forward"
			} else { //facing left
				_direction = "back"
			}
		break;
		
		case 1: //up
			_direction = "up"
		break;
		
		case 2: //left
			if (sign(argument[0].image_xscale) = -1) { //facing left
				_direction = "forward"
			} else { //facing right
				_direction = "back"
			}
		break;
		
		case 3: //down
			_direction = "down"
		break;
	}
}
switch (argument[2]) { //get attack type as string
	case 0: //neutral
		_type = "jab"
	break;
	case 1: //tilt
		_type = "tilt"
	break;
	case 2: //smash
		_type = "smash"
	break;
	case 3: //special
		_type = "special"
	break;
	case 4: //dash
		_type = "dash_attack"
	break;
	case 5: //aerial
		_type = "aerial"
	break;
}

_sprite = scr_get_sprite(argument[0], _type + "_" + _direction)