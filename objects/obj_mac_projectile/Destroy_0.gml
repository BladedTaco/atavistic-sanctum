/// @description 
creator.hitbox_override = false
creator.image_speed = 1 //start animation if not already playing
if (target = creator) { //if colliding with creator
	//rotate around the centre of the sprite
	var _gx = (creator.bbox_left + creator.bbox_right)/2
	var _gy = (creator.bbox_top + creator.bbox_bottom)/2
	var _d = point_direction(xprevious, yprevious, _gx, _gy)
	_d -= angle_difference(_d, last_dir) * 0.5;
	_d = -degtorad(_d)
	var _xx = creator.x - _gx
	var _yy = creator.y - _gy
	creator.x = _xx*cos(_d) - _yy*sin(_d) + _gx
	creator.y = _xx*sin(_d) - _yy*cos(_d) + _gy
	creator.sprite_index = spr_mac_special_up //set sprite
	creator.image_index = 0 //set image index
	creator.image_angle = radtodeg(-_d) - 90 //set image angle
	obj_match_handler.state[creator.player_number] = SPECIAL_ATTACK
} else {
	//set state and sprite
	if (scr_check_for_ground(creator)) {
		obj_match_handler.state[creator.player_number] = GROUNDED
		creator.image_index = 0
		creator.sprite_index = spr_mac_idle
	} else {
		obj_match_handler.state[creator.player_number] = scr_perform_freefall(creator, creator.player_number)
	}
}