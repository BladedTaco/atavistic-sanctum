///@func scr_get_knockback(attacker, attacked, attack)
///@param attacker - the hitbox performing the attack
///@param attacked - the hitbox object being attacked
///@param attack - the index of the attack
///@desc an additive passthrough script for applying impulse from an attack

//knockback formula in readable form
/*
 / / /	7(damage + 3)(damage + percent)		  \							\				     \
| | |	-------------------------------		+7 | * (scaling knockback)^2 | + (base knockback) | * state
 \ \ \				weight*10				  /							/					 /
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

_mag =  argument[0].d + 3				//damage taken + 3
_mag *= argument[0].d + _id.percentage	// k*(damage taken + percentage)
_mag /= _id.weight*10					// k/(weight*10)
_mag += 7								// k + 7
_mag *= power(argument[0].s, 2)			// k * (s^2)
_mag += argument[0].b					// k + base knockback
_mag *= _id.bracing						// k + state scaling
_mag /= 100								// k / 100
show_debug_message(_mag)
_id.percentage += argument[0].d //apply damage

scr_apply_impulse(_id, _id.player_number, _dir, _mag, true) //apply the knockback impuls
scr_momentum_delay(_id, _id.momentum_x, _id.momentum_y, argument[0].h, true)

switch (round(_dir/90)) {
	case 0: case 4://right
		_id.sprite_index = scr_get_sprite(_id, "hurt_side")
		_id.image_xscale = -1
	break;
	case 1: //up
		_id.sprite_index = scr_get_sprite(_id, "hurt_up")
		_dir = point_direction(argument[1].x, argument[1].y, argument[0].x, argument[0].y)
		if (abs(angle_difference(0, _dir)) > 90) { //facing left
			_id.image_xscale = -1
		} else { //facing right
			_id.image_xscale = 1
		}
	break;
	case 2: //left
		_id.sprite_index = scr_get_sprite(_id, "hurt_side")
		_id.image_xscale = -1
	break;
	case 3: //down
		_id.sprite_index = scr_get_sprite(_id, "hurt_down")
		_id.image_xscale = -1
	break;

}