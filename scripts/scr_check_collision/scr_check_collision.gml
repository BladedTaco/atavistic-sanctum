///@func scr_check_collision(shape, _maj, _min, _x, _y)
///@param _surf - the surface its drawn on
///@desc creats the hitbox object with the hitbox of the given shape
/*
if (argument[3] < 100) { exit }
if (argument[3] > 1000) { exit }
if (argument[4] < 100) { exit }
if (argument[4] > 1000) { exit }
//sprite mask collisions for hitboxes, do bounding box checks
var _width = abs(argument[1]) + abs(argument[2])
var _spr = sprite_create_from_surface(argument[0], argument[3] - _width, argument[4] - _width, _width*2, _width*2, true, false, _width, _width)
sprite_collision_mask(_spr, true, 0, 0, 0, 0, 0, 0, 0)
with (instance_create(argument[3], argument[4], obj_hitbox)) {
	sprite_index = _spr	
	depth = -10
}

*/
	global.bbox_shape = argument[0]
	global.bbox_maj = argument[1]
	global.bbox_min = argument[2]
	global.bbox_dir = argument[5]
instance_create(argument[3], argument[4], obj_hitbox)