///@func scr_handle_special_collision(_id, _id2)
///@param _id - the id of one of the colliding hitboxes/hurtboxes (normal) (hurtbox in a hitbox/hurtbox collision)
///@param _id2 - the id of the other colliding hitbox/hurtbox (special) (hitbox in a hitbox/hurtbox collision)
///@desc handles what to do once a collision is found between two hitboxes

if (argument[1].creator.object_index = obj_player) {
	//if arguments are in wrong order, recall correctly
	scr_handle_special_collision(argument[1], argument[0])
	exit
}

if (argument[0].creator.object_index != obj_player) {
	if (argument[0].creator.creator = argument[1].creator.creator) {
		exit
	}
}

//if one of the hurtboxes is a shield hitbox, and the other is a hitbox, hurt the shield by damage
for (var i = 0; i < 2; i++) {
	var _id = argument[(i+1) mod 2].creator
	var _id2 = argument[i].creator
	if (_id2.object_index = obj_shield) {
		if (argument[(i+1) mod 2].hitbox) { 
			if (_id2.alarm[0] <= 0) {
				_id2.creator.shield_percentage -= argument[(i+1) mod 2].d
				_id2.alarm[0] = GAME_SPEED/6
			}
		} else {
			if (_id.object_index = obj_player) {
				scr_apply_impulse(_id, _id.player_number, point_direction(_id2.creator.x, _id2.creator.y, _id.x, _id.y) - _id.image_angle, _IMPULSE._RIGIDITY/100, false)
			}
		}
		exit //dont execute further code
	}
}

if (argument[0].hitbox = argument[1].hitbox) { //same type
	var _d = point_direction(argument[0].x, argument[0].y, argument[1].x, argument[1].y)
	if (argument[0].hitbox) { //hitbox colliding with hitbox
		argument[1].creator._dir = point_direction(argument[1].x, argument[1].y, argument[0].x, argument[0].y)
		instance_destroy(argument[1].creator) //destroy the special hitbox creator
		if (argument[0].creator.object_index != obj_player) { //if the other hitbox is special, destroy it
			instance_destroy(argument[0].creator)
		}
	} else { //hurtbox colliding with hurtbox
		argument[1].creator.target = argument[0].creator
		argument[1].creator._dir = point_direction(argument[1].x, argument[1].y, argument[0].x, argument[0].y)
		instance_destroy(argument[1].creator) //destroy the special object
	}
} else { //a hitbox colliding with a hurtbox
	//call the knockback formula
	if (argument[1].creator.creator != argument[0].creator) {
		scr_get_knockback(argument[1], argument[0], true)
	}
}