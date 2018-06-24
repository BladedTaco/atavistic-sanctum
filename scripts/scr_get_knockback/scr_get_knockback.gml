///@func scr_get_knockback(attacker, attacked, attack)
///@param attacker - the hitbox performing the attack
///@param attacked - the hitbox object being attacked
///@param attack - the index of the attack
///@desc an additive passthrough script for applying impulse from an attack

//knockback formula in readable form
/*
 / / /	(damage + 1)(damage + percent)		  \		(scaling knockback)^2 \				       \
| | |	-------------------------------		+1 | * ----------------------  | + (base knockback) | * state
 \ \ \				weight*1000				  /				4			  /					   /
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

switch (_dir) {
	case IN: 
		_dir = point_direction(argument[1].x, argument[1].y, argument[0].x, argument[0].y)
	break;
	case OUT: 
		_dir = point_direction(argument[0].x, argument[0].y, argument[1].x, argument[1].y)
	break;
	case DIR:
		_dir = argument[0].image_angle
	break;
	case HOLD_DIR: //this is equivalent to hold	
		show_message("Grabs are not currrently implemented")
	break;	
	default:
	break;
}

var _id = argument[1].creator

_mag =  argument[0].d + 1				// k = damage taken + 1
_mag *= argument[0].d + _id.percentage	// k = k*(damage taken + percentage)
_mag /= _id.weight*1000					// k = k/(weight*1000)
_mag += 1								// k = k + 1
_mag *= argument[0].s * argument[0].s	// k = k * (s^2)
_mag *= 0.25							// k = k/4
_mag += argument[0].b					// k = k + base knockback
_mag *= _id.bracing						// k = k + state scaling

if ((_id.alarm[4] <= 0) or (_id.last_damage + 5 < argument[0].d)) { //if not sleeping hitbox or a significantly stronger hitbox
	_id.percentage += argument[0].d //apply damage
	_id.last_damage = argument[0].d
	scr_apply_impulse(_id, _id.player_number, _dir, _mag, true) //apply the knockback impuls
	scr_momentum_delay(_id, _id.momentum_x, _id.momentum_y, argument[0].h, true)
	if (instance_exists(_id.attacker)) {
		_id.attacker.image_speed = 1
	}
	_id.attacker = argument[0].creator
	_id.attacker.image_speed = 0
	_id.image_speed = 0
	//handle hitbox sleeping alarm
	if ((_mag > 3) or (argument[0].d > 3)) {//if large attack
		//set the attacked players hitbox sleeping alarm
		_id.alarm[4] = _mag
	}
}
