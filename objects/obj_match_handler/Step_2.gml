/// @description save replay and check collisions

var _min_x = room_width
var _min_y = room_height
var _max_x = 0
var _max_y = 0
with (obj_player) {
	if (!dead) {
		if (_min_x > x + effective_x) { _min_x = x + effective_x }
		if (_min_y > y + effective_y) { _min_y = y + effective_y }
		if (_max_x < x + effective_x) { _max_x = x + effective_x }
		if (_max_y < y + effective_y) { _max_y = y + effective_y }
	}
}
_min_x = max(_min_x, 0)
_min_y = max(_min_y, 0)
_max_x = min(_max_x, room_width)
_max_y = min(_max_y, room_height)

x = lerp(x, (_min_x + _max_x)/2, 0.25) //move towards the centre of the players
y = lerp(y, (_min_y + _max_y)/2, 0.25) //move towards the centre of the players


var _width = max(_max_x - _min_x, 405) + 75
var _height = max(_max_y - _min_y, 195) + 75

if (_height*(16/9) < _width) {
	_height = min(_width*(9/16), room_height)
	_width = min(_width, _height*(16/9))
} else {
	_width = min(_height*(16/9), room_width)
	_height = min(_height, _width*(9/16))
}

camera_set_view_size(view_camera[0], _width, _height)


view_set_wport(view_camera[0], 960)
view_set_hport(view_camera[0], 540)

if (global.debug) { show_debug_message(object_get_name(event_object) + " " + string(event_type) + "-" + string(event_number)) }