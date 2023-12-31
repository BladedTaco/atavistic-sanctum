///@func scr_check_collision(shape, _maj, _min, _x, _y, _dir, *dmg, *dir, *b, *s, *h)
///@param shape - the shape of the hitbox
///@param _maj - the major axis of the hitbox
///@param _min - the minor axis of the hitbox
///@param _x - the x position of the hitboxes centre
///@param _y - the y position of the hitboxes centre
///@param _dir - the rotation of the hitbox
///@param *dmg - the stats assigned to the hitbox
///@param *dir - the stats assigned to the hitbox
///@param *b - the stats assigned to the hitbox
///@param *s - the stats assigned to the hitbox
///@param *h - the stats assigned to the hitbox
///@desc creates the hitbox object with the hitbox of the given shape
if ((global.bbox[10].image_speed != 0) or (global.bbox[10].hitbox_override)) { //dont create hitboxes if not animating and not overridden
	if (argument_count > 6) {
		global.bbox[4] = true
		global.bbox[5] = argument[6] //damage
		global.bbox[6] = argument[7] //direction
		global.bbox[7] = argument[8] //base knockback
		global.bbox[8] = argument[9] //scaling knockback
		global.bbox[9] = argument[10] //hitstun multiplier
	} else {
		global.bbox[4] = false
	}
	global.bbox[0] = argument[0] //shape
	global.bbox[1] = argument[1] //maj
	global.bbox[2] = argument[2] //min
	global.bbox[3] = argument[5] //dir
	instance_create(argument[3], argument[4], obj_hitbox)
}