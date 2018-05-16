///@func scr_get_knockback(attacker, attacked, attack)
///@param attacker - the player performing the attack
///@param attacked - the player object being attacked
///@param attack - the index of the attack
///@desc an additive passthrough script for applying impulse from an attack

//knockback formula in readable form
/*
 / / /	7(damage + 3)(damage + percent)		  \							\				     \
| | |	-------------------------------		+7 | * (scaling knockback)^2 | + (base knockback) | * state
 \ \ \				weight*10				  /							/					 /
*/

var d = 0 //the damage of the attack				get from some sort of data storage
var s = 0 //the knockback scaling of the attack		get from some sort of data storage
var b = 0 //the base knocback of the attack			get from some sort of data storage
var _dir = 0 //get from some sort of data storage
var _mag = 0 //the magnitude of the knockback vector


_mag =  d + 3								//damage taken + 3
_mag *= d + argument[1].percentage			// k*(damage taken + percentage)
_mag /= argument[1].weight*10				// k/(weight*10)
_mag += 7									// k + 7
_mag *= power(s, 2)							// k * (s^2)
_mag += b									// k + base knockback
_mag *= argument[1].bracing					// k + state scaling

scr_apply_impulse(argument[1], _dir, _mag, true) //apply the knockback impulse