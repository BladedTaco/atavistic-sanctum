/// @description save replay and check collisions

//get dimensions of room
var _min_x = room_width
var _min_y = room_height
var _max_x = 0
var _max_y = 0
with (obj_player) { //for each player
	if (!dead) { //if alive
		//get the maximum range of x and y values
		if (_min_x > x + effective_x) { _min_x = x + effective_x }
		if (_min_y > y + effective_y) { _min_y = y + effective_y }
		if (_max_x < x + effective_x) { _max_x = x + effective_x }
		if (_max_y < y + effective_y) { _max_y = y + effective_y }
	}
}
//limit ranges to room dimensions
_min_x = max(_min_x, 0)
_min_y = max(_min_y, 0)
_max_x = min(_max_x, room_width)
_max_y = min(_max_y, room_height)


x = lerp(x, (_min_x + _max_x)/2, 0.25) //move towards the average centre of the players
y = lerp(y, (_min_y + _max_y)/2, 0.25) //move towards the average centre of the players

//get width and height for camera
var _width = max(_max_x - _min_x, 405) + 75
var _height = max(_max_y - _min_y, 195) + 75

if (_height*(16/9) < _width) { //if area is too wide
	_height = min(_width*(9/16), room_height) //limit height
	_width = min(_width, _height*(16/9)) //shorten width to height*aspect ratio
} else { //if area is too tall
	_width = min(_height*(16/9), room_width) //limit width
	_height = min(_height, _width*(9/16)) //shorten height to width*aspect ratio
}

camera_set_view_size(view_camera[0], _width, _height) //set the view size of the camera

//set the resolution of the camera
view_set_wport(view_camera[0], 960)
view_set_hport(view_camera[0], 540)

