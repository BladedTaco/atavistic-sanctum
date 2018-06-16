///@func scr_apply_impulse(object, player_number, direction, magnitude, attack)
///@param object - the player object to apply the momentum to
///@param player_number - the number of the player
///@param direction - the direction of the impulse vector
///@param magnitude - the magnitude of the impulse vector
///@param attack - if the impulse is from an attack
///@desc applies an impulse to the object given in the direciton given (main mode of movement) also

var _mag = argument[3] //store the initial magnitude of the vector

if (!argument[4]) {//if it is not an attack
	_mag *= (1/argument[0].weight) //mulitply the magnitude by the inverse of its weight	more weight = less mag
	_mag *= 1 + (argument[0].percentage/100) //multiply magnitude by 1 + percentage (as decimal) more % = more mag
}
var _d = argument[2]
if (!((abs(argument[2] - 180) = 90) or (argument[4]) or (argument[0].image_angle = 0)))  {
	_d += argument[0].image_angle
}
argument[0].momentum_x += lengthdir_x(_mag, _d) //apply horizontal momentum
argument[0].momentum_y += lengthdir_y(_mag, _d) //apply vertical momentum