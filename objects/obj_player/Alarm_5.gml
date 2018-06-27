/// @description grab alarm (attacker)
if (instance_exists(attacker)) {
	//set both participants to airborne and push them apart
	obj_match_handler.state[attacker.player_number] = AIRBORNE
	obj_match_handler.state[player_number] = AIRBORNE
	sprite_index = scr_get_sprite(id, "air_move")
	image_index = 0
	attacker.sprite_index = scr_get_sprite(attacker, "air_move")
	attacker.image_index = 0
	var _d = point_direction(0, 0, image_xscale, 0)
	scr_apply_impulse(attacker, attacker.player_number, _d, _IMPULSE._GRAB_RELEASE/100, false)
	scr_apply_impulse(id, player_number, _d + 180, _IMPULSE._GRAB_RELEASE/100, false)
} else { //no attacker found, return to normal state
	obj_match_handler.state[player_number] = AIRBORNE
	sprite_index = scr_get_sprite(id, "air_move")
	image_index = 0
}