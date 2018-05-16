///@func add_moves
///@desc run at the creation of the game to create all the data for moves and their hitboxes

//values for below array will need to be increased if more moves are created
var _i_max = 250 //total number of sprites used for characters
var _o_max = 20 //maximum number of sub_images per used sprite
_o_max *= 100
global.hitbox[_i_max, _o_max] = -1 //initialise the array		accessors are [sprite_index, image_index*100 + index*10 + entry]
global.hurtbox[_i_max, _o_max] = -1 //initialise the array		accessors are [sprite_index, image_index*100 + index*10 + entry]
for (var i = 0; i < _i_max; i++) {
	for (var o = 0; o < _o_max; o++) {
		global.hitbox[i, o] = -1
		global.hurtbox[i, o] = -1
	}
}

//add every moves hitboxes and hurtboxes (projectile attacks are not considered for hitbox, eg. eth n special)

#region hitboxes and hurtboxes ;(

//bal idle (no hitbox)
scr_add_hurtbox(spr_bal_idle, 0, 0, CIRCLE, 16, 18, 0, -27, 0)
scr_add_hurtbox(spr_bal_idle, 1, 0, CIRCLE, 16, 18, 0, -28, 0)
scr_add_hurtbox(spr_bal_idle, 2, 0, CIRCLE, 16, 18, 0, -29, 0)
scr_add_hurtbox(spr_bal_idle, 3, 0, CIRCLE, 16, 18, 0, -30, 0)
scr_add_hurtbox(spr_bal_idle, 4, 0, CIRCLE, 16, 18, 0, -29, 0)
scr_add_hurtbox(spr_bal_idle, 5, 0, CIRCLE, 16, 18, 0, -28, 0)
scr_add_hurtbox(spr_bal_idle, 6, 0, CIRCLE, 16, 18, 0, -27, 0)
scr_add_hurtbox(spr_bal_idle, 7, 0, CIRCLE, 16, 18, 0, -28, 0)
scr_add_hurtbox(spr_bal_idle, 8, 0, CIRCLE, 16, 18, 0, -29, 0)
scr_add_hurtbox(spr_bal_idle, 9, 0, CIRCLE, 16, 18, 0, -30, 0)
scr_add_hurtbox(spr_bal_idle, 10, 0, CIRCLE, 16, 18, 0, -29, 0)
scr_add_hurtbox(spr_bal_idle, 11, 0, CIRCLE, 16, 18, 0, -28, 0)

//bal walk (no hitbox)
scr_add_hurtbox(spr_bal_walk, 0, 0, CIRCLE, 16, 21, 12, -24, -30)
scr_add_hurtbox(spr_bal_walk, 1, 0, CIRCLE, 16, 21, 12, -24, -30)
scr_add_hurtbox(spr_bal_walk, 2, 0, CIRCLE, 16, 21, 12, -25, -30)
scr_add_hurtbox(spr_bal_walk, 3, 0, CIRCLE, 16, 21, 11, -26, -30)
scr_add_hurtbox(spr_bal_walk, 4, 0, CIRCLE, 16, 21, 12, -26, -30)
scr_add_hurtbox(spr_bal_walk, 5, 0, CIRCLE, 16, 21, 12, -25, -30)

//bal run (no hitboxes)
scr_add_hurtbox(spr_bal_run, 0, 0, CIRCLE, 16, 21, 17, -18, -45)
scr_add_hurtbox(spr_bal_run, 1, 0, CIRCLE, 16, 21, 17, -18, -45)
scr_add_hurtbox(spr_bal_run, 2, 0, CIRCLE, 16, 21, 17, -18, -45)
scr_add_hurtbox(spr_bal_run, 3, 0, CIRCLE, 16, 21, 17, -18, -45)

//bal speed up (no hitboxes)
scr_add_hurtbox(spr_bal_speed_up, 0, 0, CIRCLE, 16, 18, 0, -27, 0)
scr_add_hurtbox(spr_bal_speed_up, 1, 0, CIRCLE, 14, 20, 7, -25, -20)

//bal dash (no hitboxes)
scr_add_hurtbox(spr_bal_dash, 0, 0, CIRCLE, 16, 18, 0, -27, 0)
scr_add_hurtbox(spr_bal_dash, 1, 0, CIRCLE, 16, 21, 12, -24, -30)

//bal dash slow (no hitboxes)
scr_add_hurtbox(spr_bal_dash_slow, 0, 0, CIRCLE, 16, 21, 12, -24, -30)
scr_add_hurtbox(spr_bal_dash_slow, 1, 0, CIRCLE, 16, 18, 0, -27, 0)

//bal speed down (no hitboxes)
scr_add_hurtbox(spr_bal_speed_down, 0, 0, CIRCLE, 14, 20, 7, -25, -20)
scr_add_hurtbox(spr_bal_speed_down, 1, 0, CIRCLE, 16, 18, 0, -27, 0)

//bal jump (no hitboxes)
scr_add_hurtbox(spr_bal_jump, 0, 0, CIRCLE, 16, 18, 0, -27, 0)
scr_add_hurtbox(spr_bal_jump, 1, 0, CIRCLE, 16, 18, 0, -29, 0)
scr_add_hurtbox(spr_bal_jump, 2, 0, CIRCLE, 16, 18, 0, -31, 0)

//bal air move (no hitboxes)
scr_add_hurtbox(spr_bal_air_move, 0, 0, CIRCLE, 16, 18, 2, -31, 0)
scr_add_hurtbox(spr_bal_air_move, 1, 0, CIRCLE, 16, 18, 2, -31, 0)
scr_add_hurtbox(spr_bal_air_move, 2, 0, CIRCLE, 16, 18, 2, -31, 0)
scr_add_hurtbox(spr_bal_air_move, 3, 0, CIRCLE, 16, 18, 2, -31, 0)

//bal air dodge (no hitboxes, no hurtboxes)

//bal air jump (no hitboxes)
scr_add_hurtbox(spr_bal_air_jump, 0, 0, CIRCLE, 15, 20, 2, -31, 0)
scr_add_hurtbox(spr_bal_air_jump, 1, 0, CIRCLE, 16, 21, 9, -28, -45)
scr_add_hurtbox(spr_bal_air_jump, 2, 0, CIRCLE, 15, 20, 12, -20, 0)
scr_add_hurtbox(spr_bal_air_jump, 3, 0, CIRCLE, 16, 21, 10, -12, -45)
scr_add_hurtbox(spr_bal_air_jump, 4, 0, CIRCLE, 15, 20, 1, -7, 0)
scr_add_hurtbox(spr_bal_air_jump, 5, 0, CIRCLE, 16, 21, -7, -9, -45)
scr_add_hurtbox(spr_bal_air_jump, 6, 0, CIRCLE, 15, 20, -10, -18, 0)
scr_add_hurtbox(spr_bal_air_jump, 7, 0, CIRCLE, 16, 21, -6, -25, -45)
scr_add_hurtbox(spr_bal_air_jump, 8, 0, CIRCLE, 15, 20, 2, -31, 0)

//bal land
scr_add_hurtbox(spr_bal_land, 0, 0, CIRCLE, 15, 20, 1, -31, 0)
scr_add_hurtbox(spr_bal_land, 0, 0, CIRCLE, 15, 20, 0, -30, 0)
scr_add_hurtbox(spr_bal_land, 0, 0, CIRCLE, 15, 20, 0, -29, 0)
scr_add_hurtbox(spr_bal_land, 0, 0, CIRCLE, 15, 20, 0, -28, 0)

#endregion that took forever