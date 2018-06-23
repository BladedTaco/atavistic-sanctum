///@func scr_perform_attack(object, player_number, attack_type, direction)
///@param object - the instance id of the character object
///@param player_number - the number of the player to perform the attack with
///@param attack_type - whether the attack is neutral, tilt, smash, special, dash, aerial, grab jab (0 1 2 3 4 5 6 respectively)
///@param direction - the direction of movement
///@desc causes the given character to perform an attack and returns state

if (argument[2] = 3) { //if special attack
	if (obj_input.sticky_special[argument[1]]) { return state[argument[1]] } //exit the script if attack button is held
	obj_input.sticky_special[argument[1]] = true //set sticky attack to true
} else { //if normal attack
	if (obj_input.sticky_attack[argument[1]]) { return state[argument[1]] } //exit the script if attack button is held
	obj_input.sticky_attack[argument[1]] = true //set sticky attack to true
}

var _type, _direction, _sprite, _ret //define local variables

_direction = scr_get_direction(argument[0], argument[1], argument[3]) //get the directon

switch (argument[2]) { //get attack type as string
	case 0: //jab
		_type = "jab"
		_ret = TILT_ATTACK
		argument[0].jab = (argument[0].jab + 1) mod 4 //incrment jab counter
	break;
	case 1: //tilt
		_type = "tilt"
		_ret = TILT_ATTACK
	break;
	case 2: //smash
		_type = "smash"
		_ret = SMASH_ATTACK
		argument[0].alarm[2] = GAME_SPEED //set max smash hold
		argument[0].smash_charge = 0
	break;
	case 3: //special
		_type = "special"
		_ret = SPECIAL_ATTACK
		if (_direction = "back") {
			argument[0].image_xscale *= -1
			_direction = "forward"
		}
	break;
	case 4: //dash
		_type = "dash_attack"
		_ret = TILT_ATTACK
	break;
	case 5: //aerial
		_type = "aerial"
		_ret = AIR_ATTACK
	break;
	case 6: //grab jab
		_type = "grab_jab"
		_ret = TILT_ATTACK
	break;
}

_sprite = scr_get_sprite(argument[0], string(_type + "_" + _direction)) //get sprite

if (sprite_exists(_sprite)) { //if the sprite exists
	argument[0].sprite_index = _sprite //set sprite to the attack sprite
	argument[0].image_index = 0 //set animation frame to the first one
	return _ret //return the state
}
return FREEFALL //return freefall state is sprite is not found, this should never happen