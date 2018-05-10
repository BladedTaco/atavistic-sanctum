///@func scr_perform_attack(object, player_number, attack_type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the shield with
///@param attack_type - whether the attack is neutral, tilt, smash, special, dash, or aerial (0 1 2 3 4 5 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform an attack
var _type, _direction, _sprite //define local variables

_direction = scr_get_direction(argument[0], argument[1], argument[3]) //get the directon


switch (argument[2]) { //get attack type as string
	case 0: //jab
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

_sprite = scr_get_sprite(argument[0], _type + "_" + _direction) //get sprite

if (sprite_exists(_sprite)) { //if the sprite exists
	argument[0].sprite_index = _sprite //set sprite to the attack sprite
	argument[0].image_index = 0 //set animation frame to the first one
}