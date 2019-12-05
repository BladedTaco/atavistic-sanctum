/// @description grab alarm (attacker)
if (instance_exists(attacker)) { //if still being grabbed
	//set both participants to airborne and push them apart
	obj_match_handler.state[attacker.player_number] = AIRBORNE
	obj_match_handler.state[player_number] = AIRBORNE
	//set animation states
	sprite_index = scr_get_sprite(id, "air_move")
	image_index = 0
	attacker.sprite_index = scr_get_sprite(attacker, "air_move")
	attacker.image_index = 0
	//get direction
	var _d = point_direction(0, 0, image_xscale, 0)
	//push players apart
	scr_apply_impulse(attacker, attacker.player_number, _d, round(_IMPULSE._GRAB_RELEASE)/100, false)
	scr_apply_impulse(id, player_number, _d + 180, round(_IMPULSE._GRAB_RELEASE)/100, false)
} else { //no attacker found, return to normal state
	//set state and animation to airborne
	obj_match_handler.state[player_number] = AIRBORNE
	sprite_index = scr_get_sprite(id, "air_move") 
	image_index = 0
}