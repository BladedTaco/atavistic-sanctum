///@func scr_handle_collision(_id, _id2)
///@param _id - the id of one of the colliding hitboxes/hurtboxes (hurtbox in a hitbox/hurtbox collision)
///@param _id2 - the id of the other colliding hitbox/hurtbox (hitbox in a hitbox/hurtbox collision)
///@desc handles what to do once a collision is found between two hitboxes

if (argument[0].hitbox = argument[1].hitbox) { //same type
	var _d = point_direction(argument[0].x, argument[0].y, argument[1].x, argument[1].y)
	if (argument[0].hitbox) { //hitbox colliding with hitbox
		if ((argument[0].d != 0) and (argument[1].d != 0)) { //if neither one is a windbox
			if (abs(argument[0].d - argument[1].d) < 3) { //if difference in damage is less then 3%
				scr_apply_impulse(argument[0].creator, argument[0].creator.player_number, _d + 180, _IMPULSE._CLASH/100, false)
				scr_apply_impulse(argument[1].creator, argument[1].creator.player_number, _d, _IMPULSE._CLASH/100, false)
			}
		}
	} else { //hurtbox colliding with hurtbox
		if ((obj_match_handler.state[argument[0].creator.player_number] != GRABBED)
		and (obj_match_handler.state[argument[1].creator.player_number] != GRABBED)) { //if not in a grab
			var _l = _IMPULSE._RIGIDITY/(100*max(point_distance(argument[0].x, argument[0].y, argument[1].x, argument[1].y), 1))
			if (((_d + 90) mod 360) <= 180) {
				_d = 0	
			} else {
				_d = 180	
			}
			scr_apply_impulse(argument[0].creator, argument[0].creator.player_number, _d + 180 + image_angle, _l, false)
			scr_apply_impulse(argument[1].creator, argument[1].creator.player_number, _d + image_angle, _l, false)
		}
	}
} else { //a hitbox colliding with a hurtbox
	//call the knockback formula
	scr_get_knockback(argument[1], argument[0], true)
}