///@func scr_get_knockback(attacker, attacked, attack)
///@param attacker - the hitbox performing the attack
///@param attacked - the hitbox object being attacked
///@param attack - the index of the attack
///@desc an additive passthrough script for applying impulse from an attack

//knockback formula in readable form
/*
 / / /	(damage + 1)(damage + percent mul)	  \		scaling knockback mul		\				    \
| | |	-------------------------------		+1 | * ---------------------------	| + (base knockback) | * state
 \ \ \				weight*300				  /					4				/				  /
*/

if (argument[0].hitbox = false) {
	if (argument[1].hitbox = true) {
		scr_get_knockback(argument[1], argument[0], argument[2])
		exit //if argument 1 and 0 are wrong way arounnd, call the function correctly
	} else {
		//this should not be possible, remove this if it is found to not be
		show_message("Knockback two hurtboxes, fix this")
		exit
	}
}

var _dir = argument[0].a //the direction of the attack
var _mag = 0 //the magnitude of the knockback vector
var _id = argument[1].creator //attacked
var _id2 = argument[0].creator //attacker

if ((_id2.character = GEO) and (argument[0].h > 1)) { //reset geo histun on successful stunning attack
	_id2.hitstun = 1
}

switch (_dir) {
	case IN: 
		_dir = point_direction(argument[1].x, argument[1].y, argument[0].x, argument[0].y)
	break;
	case OUT: 
		_dir = point_direction(argument[0].x, argument[0].y, argument[1].x, argument[1].y)
	break;
	case DIR:
		_dir = _id2.image_angle + 90
	break;
	case HOLD_DIR: //this is equivalent to hold	
		if (instance_exists(_id.attacker)) {
			_id.attacker.image_speed = 1
			if (_id.attacker.alarm[5] > 0) { //if was in the middle of a grab
				//release the grab
				_id.attacker.alarm[5] = 0
				_id.attacker.attacker = noone //make the attackers attacker noone
			}
		}
		if (instance_exists(_id2.attacker)) {
			_id2.attacker.image_speed = 1
			if (_id2.attacker.alarm[5] > 0) { //if was in the middle of a grab
				//release the grab
				_id2.attacker.alarm[5] = 0
				_id2.attacker.attacker = noone //make the attackers attacker noone
			}
		}
		//set each player as each others attacker
		_id.alarm[6] = ATTACKER_REFRESH	 //set attacker refresh alarm
		_id2.alarm[6] = ATTACKER_REFRESH //set attacker refresh alarm
		_id.attacker = _id2
		_id2.attacker = _id
		//move the attacker to the attacked if this is from a ledge grab
		if (obj_match_handler.state[_id2.player_number] = LEDGE_ALT) {
			_id2.x = _id.x
			_id2.y = _id.y
		}
		//set the sprites
		_id.sprite_index = scr_get_sprite(_id, "grabbed")
		_id.image_index = 0
		if (_id2.character = ETH) {
			if (!instance_exists(_id2.child_object)) {
				with (instance_create(-100, -100, obj_eth_grab)) {
					creator = _id2
					_id2.child_object = id
				}
			}
			_id2.child_object.image_index = 0
			_id2.child_object.sprite_index = spr_eth_grab_hold
			_id2.child_object.state = 1
			_id2.child_object.attacker = _id
			_id2.sprite_index = spr_eth_idle
			_id2.image_index = 0
		} else {
			_id2.sprite_index = scr_get_sprite(_id2, "grab_hold")
			_id2.image_index = 0
		}
		obj_match_handler.state[_id2.player_number] = HOLDING //set the holding player
		obj_match_handler.state[_id.player_number] = GRABBED //set the held player
		_id.percentage += argument[0].d //apply damage
		_id.last_damage = argument[0].d //remember the amount of damage taken
		_id2.alarm[5] = GAME_SPEED*5 //set grab alarm time
		_id.image_xscale = -_id2.image_xscale //face the right direction
		exit //exit the script
	break;	
	default:
	break;
}

if (argument[0].h = -1) { //if negative hitstun, only apply damage and no state change or knockback
	_id.percentage += argument[0].d //apply damage
	_id.last_damage = argument[0].d //remember the amount of damage taken
} else {
	if (argument[0].s != 0) { //if scaling knockback is to be applied
		_mag =  argument[0].d + 1				// k = damage taken + 1
		_mag *= argument[0].d + power(_id.percentage/7, 2)	// k = k*(damage taken + percentage^2)
		_mag /= _id.weight*300					// k = k/(weight*300)
		_mag += 1								// k = k + 1
		_mag *= power(abs(argument[0].s) + lerp((1/max(abs(argument[0].s), 1))*3, 2, 0.5), 1.5)		// k = k * ((s+(1/s2))^1.5)
		_mag *= 0.25*sign(argument[0].s)		// k = (k*sign(scaling))/4
	}
	_mag += argument[0].b					// k = k + base knockback
	_mag *= _id.bracing						// k = k + state scaling
	
	if (_mag < 0) { //negative magnitude means to follow the attacker
		_mag = point_distance(0, 0, _id2.momentum_x, _id2.momentum_y)*4
		_id.momentum_x = 0
		_id.momentum_y = 0
	}
	
	//if (not sleeping hitbox) or (a significantly stronger hitbox) or (a windbox) or (high hitstun)
	if ((_id.alarm[4] <= 0) or (_id.last_damage + 5 < argument[0].d) or (argument[0].d = 0) or (argument[0].h > 1)) { 
		_id.percentage += argument[0].d //apply damage
		_id.last_damage = argument[0].d //remember the amount of damage taken
		scr_apply_impulse(_id, _id.player_number, _dir, _mag, true) //apply the knockback impulse
		scr_momentum_delay(_id, _id.momentum_x, _id.momentum_y, argument[0].h, true)
		_id.alarm[6] = ATTACKER_REFRESH //set attacker refresh alarm
		if (instance_exists(_id.attacker)) {
			_id.attacker.image_speed = 1
			if (_id.attacker.alarm[5] > 0) { //if was in the middle of a grab
				//release the grab
				_id.attacker.alarm[5] = 0
				_id.attacker.attacker = noone //make the attackers attacker noone
			}
		}
		if (_id2.object_index = obj_player) {
			_id.attacker = _id2
			if (argument[0].h > 0) {
				_id2.image_speed = 0
				_id.image_speed = 0
				_id.alarm[7] = max(_mag*argument[0].h, 1)
				_id2.alarm[7] = max(_mag*argument[0].h*0.75, 1) //attacker is stuck for slightly less than attackee
			}
		}
		//handle hitbox sleeping alarm
		if ((_mag > 3) and (argument[0].d > 3)) {//if large attack
			//set the attacked players hitbox sleeping alarm
			_id.alarm[4] = _mag + 2
		}
	}
}

if (_id2.object_index = obj_eth_projectile) {
	_id2.alarm[0] = 1
	_id2.image_index = 7
}