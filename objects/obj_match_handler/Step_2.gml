/// @description save replay and check collisions

var _xx = 0
var _yy = 0
with (obj_player) {
	_xx += x + effective_x
	_yy += y + effective_y
}
_xx /= instance_number(obj_player)
_yy /= instance_number(obj_player)
x = lerp(x, _xx, 0.25) //move towards the centre of the players
y = lerp(y, _yy, 0.25) //move towards the centre of the players

//scr_record_replay() //record this frames inputs to replay file