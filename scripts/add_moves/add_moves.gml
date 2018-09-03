///@func add_moves
///@desc run at the creation of the game to create all the data for moves and their hitboxes

//values for below array will need to be increased if more moves are created
var _i_max = spr_eth_special_neutral //total number of sprites used for characters
var _o_max = 42 //maximum number of sub_images per used sprite (absolute max is 319 with this system)
_o_max *= 100
global.hitbox[_i_max, _o_max] = NULL //initialise the array		accessors are [sprite_index, image_index*100 + index*11 + entry]
global.hurtbox[_i_max, _o_max] = NULL //initialise the array		accessors are [sprite_index, image_index*100 + index*11 + entry]
for (var i = 0; i <= _i_max; i++) {
	for (var o = 0; o <= _o_max; o++) {
		global.hitbox[i, o] = NULL
		global.hurtbox[i, o] = NULL
	}
}

//add every moves hitboxes and hurtboxes (projectile attacks are not considered for hitbox, eg. eth n special)

#region hitboxes and hurtboxes

var i = 0 //variable created now for use in loops below if hurtboxes or hitboxes are constant over a large number of frames

window_set_caption("Adding Hitboxes Into Memory BAL")

#region BALLOONY 619 lines
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

	//bal land (no hitboxes)
	scr_add_hurtbox(spr_bal_land, 0, 0, CIRCLE, 15, 20, 1, -31, 0)
	scr_add_hurtbox(spr_bal_land, 1, 0, CIRCLE, 15, 20, 0, -30, 0)
	scr_add_hurtbox(spr_bal_land, 2, 0, CIRCLE, 15, 20, 0, -29, 0)
	scr_add_hurtbox(spr_bal_land, 3, 0, CIRCLE, 15, 20, 0, -28, 0)

	//bal shield (no hitboxes)
	scr_add_hurtbox(spr_bal_shield, 0, 0, CIRCLE, 15, 20, 2, -31, 0)
	scr_add_hurtbox(spr_bal_shield, 1, 0, CIRCLE, 16, 21, 9, -28, -45)
	scr_add_hurtbox(spr_bal_shield, 2, 0, CIRCLE, 20, 15, 12, -20, 0)
	scr_add_hurtbox(spr_bal_shield, 3, 0, CIRCLE, 21, 16, 11, -11, -45)
	scr_add_hurtbox(spr_bal_shield, 4, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_shield, 5, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_shield, 6, 0, CIRCLE, 15, 20, 1, -7, 0)

	//bal hold shield (no hitboxes)
	scr_add_hurtbox(spr_bal_hold_shield, 0, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_hold_shield, 1, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_hold_shield, 2, 0, CIRCLE, 15, 20, 1, -7, 0)

	//bal un shield (no hitboxes)
	scr_add_hurtbox(spr_bal_un_shield, 0, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_un_shield, 1, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_un_shield, 2, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_un_shield, 3, 0, CIRCLE, 21, 16, 11, -11, -45)
	scr_add_hurtbox(spr_bal_un_shield, 4, 0, CIRCLE, 20, 15, 12, -20, 0)
	scr_add_hurtbox(spr_bal_un_shield, 5, 0, CIRCLE, 16, 21, 9, -28, -45)
	scr_add_hurtbox(spr_bal_un_shield, 6, 0, CIRCLE, 15, 20, 2, -31, 0)

	//bal roll (no hitboxes, discontinuous hurtboxes)
	scr_add_hurtbox(spr_bal_roll, 0, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_roll, 12, 0, CIRCLE, 16, 21, -7, -26, 45)
	scr_add_hurtbox(spr_bal_roll, 13, 0, CIRCLE, 15, 20, 2, -31, 0)

	//bal dodge (no hitboxes, discontinuous hurtboxes)
	scr_add_hurtbox(spr_bal_dodge, 0, 0, CIRCLE, 15, 20, 1, -7, 0)
	scr_add_hurtbox(spr_bal_dodge, 1, 0, CIRCLE, 11, 13, 1, -5, 0)
	scr_add_hurtbox(spr_bal_dodge, 6, 0, CIRCLE, 11, 13, 1, -5, 0)
	scr_add_hurtbox(spr_bal_dodge, 7, 0, CIRCLE, 15, 20, 1, -7, 0)

	//bal ledge (no hitboxes, discontinuous hurtboxes)
	scr_add_hurtbox(spr_bal_ledge, 0, 0, CIRCLE, 15, 20, -11, 5, 0)
	scr_add_hurtbox(spr_bal_ledge, 1, 0, CIRCLE, 16, 21, -20, 9, 45)

	//bal ledge hold (no hitboxes, no hurtboxes)

	//bal ledge roll (no hitboxes, no hurtboxes)

	//bal ledge jump (no hitboxes, no hurtboxes)

	//bal ledge grab (discontinuous hitboxes, no hurtboxes)
	scr_add_move(spr_bal_ledge_grab, 3, 0, RECTANGLE, 7, 3, 26, -14, 0, 5, HOLD)
	scr_add_move(spr_bal_ledge_grab, 4, 0, RECTANGLE, 8, 4, 36, -15, 0, 5, HOLD)
	scr_add_move(spr_bal_ledge_grab, 5, 0, RECTANGLE, 9, 5, 48, -15, 0, 5, HOLD)
	scr_add_move(spr_bal_ledge_grab, 6, 0, RECTANGLE, 7, 3, 55, -11, 0, 5, HOLD)

	//bal ledge attack (discontinious hitboxes, no hurtboxes)
	scr_add_move(spr_bal_ledge_attack, 7, 0, CIRCLE, 27, 19, -9, -18, 0, 5, 320, 2, 3)
	scr_add_move(spr_bal_ledge_attack, 8, 0, CIRCLE, 23, 30, 2, -23, 0, 5, 320, 2, 3)
	scr_add_move(spr_bal_ledge_attack, 8, 1, CIRCLE, 18, 10, -9, -29, 0, 7, 10, 4, 4)
	scr_add_move(spr_bal_ledge_attack, 9, 0, CIRCLE, 27, 14, 19, -11, 0, 5, 320, 2, 3)
	scr_add_move(spr_bal_ledge_attack, 9, 1, CIRCLE, 19, 18, 18, -24, 0, 5, 320, 2, 3)
	scr_add_move(spr_bal_ledge_attack, 10, 0, CIRCLE, 16, 5, 17, -8, -60, 5, 320, 2, 3)

	//bal hurt up (no hitboxes)
	scr_add_hurtbox(spr_bal_hurt_up, 0, 0, CIRCLE, 16, 21, -7, -31, 45)

	//bal hurt side (no hitboxes)
	scr_add_hurtbox(spr_bal_hurt_side, 0, 0, CIRCLE, 16, 21, 12, -33, -45)

	//bal hurt down (no hitboxes)
	scr_add_hurtbox(spr_bal_hurt_down, 0, 0, CIRCLE, 16, 21, -20, -13, 45)

	//bal grabbed (no hitboxes)
	scr_add_hurtbox(spr_bal_grabbed, 0, 0, CIRCLE, 16, 21, 8, -14, -45)
	scr_add_hurtbox(spr_bal_grabbed, 0, 1, RECTANGLE, 2, 2, 0, 0, 0)

	//bal taunt (no hitboxes)
	scr_add_hurtbox(spr_bal_taunt, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_taunt, 1, 0, CIRCLE, 17, 19, 0, -28, 0)
	scr_add_hurtbox(spr_bal_taunt, 2, 0, CIRCLE, 19, 19, 0, -29, 0)
	scr_add_hurtbox(spr_bal_taunt, 3, 0, CIRCLE, 21, 19, 0, -30, 0)
	scr_add_hurtbox(spr_bal_taunt, 4, 0, CIRCLE, 23, 19, 0, -29, 0)
	scr_add_hurtbox(spr_bal_taunt, 5, 0, CIRCLE, 23, 19, 0, -28, 0)
	scr_add_hurtbox(spr_bal_taunt, 6, 0, CIRCLE, 20, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_taunt, 7, 0, CIRCLE, 15, 19, 0, -28, 0)
	scr_add_hurtbox(spr_bal_taunt, 8, 0, CIRCLE, 15, 19, 0, -29, 0)
	scr_add_hurtbox(spr_bal_taunt, 9, 0, CIRCLE, 15, 19, 0, -30, 0)
	scr_add_hurtbox(spr_bal_taunt, 10, 0, CIRCLE, 15, 19, 0, -29, 0)
	scr_add_hurtbox(spr_bal_taunt, 11, 0, CIRCLE, 15, 19, 0, -28, 0)

	//bal crouch (no hitboxes)
	scr_add_hurtbox(spr_bal_crouch, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_crouch, 1, 0, CIRCLE, 15, 19, 0, -25, 0)
	scr_add_hurtbox(spr_bal_crouch, 2, 0, CIRCLE, 15, 19, 0, -23, 0)
	scr_add_hurtbox(spr_bal_crouch, 3, 0, CIRCLE, 15, 19, 0, -21, 0)
	scr_add_hurtbox(spr_bal_crouch, 4, 0, CIRCLE, 15, 19, 0, -19, 0)
	scr_add_hurtbox(spr_bal_crouch, 5, 0, CIRCLE, 15, 19, 0, -17, 0)
	scr_add_hurtbox(spr_bal_crouch, 6, 0, CIRCLE, 15, 19, 0, -15, 0)
	scr_add_hurtbox(spr_bal_crouch, 7, 0, CIRCLE, 15, 19, 0, -13, 0)

	//bal crouch hold (no hitboxes)
	scr_add_hurtbox(spr_bal_crouch_hold, 0, 0, CIRCLE, 15, 19, 0, -14, 0)
	scr_add_hurtbox(spr_bal_crouch_hold, 1, 0, CIRCLE, 15, 19, 0, -13, 0)

	//bal crouch end (no hitboxes)
	scr_add_hurtbox(spr_bal_crouch_end, 0, 0, CIRCLE, 15, 19, 0, -13, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 1, 0, CIRCLE, 15, 19, 0, -15, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 2, 0, CIRCLE, 15, 19, 0, -17, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 3, 0, CIRCLE, 15, 19, 0, -19, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 4, 0, CIRCLE, 15, 19, 0, -21, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 5, 0, CIRCLE, 15, 19, 0, -23, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 6, 0, CIRCLE, 15, 19, 0, -25, 0)
	scr_add_hurtbox(spr_bal_crouch_end, 7, 0, CIRCLE, 15, 19, 0, -27, 0)

	//bal grab side (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_grab_side, 0, 0, CIRCLE, 16, 20, 7, -27, -30)
	scr_add_hurtbox(spr_bal_grab_side, 1, 0, CIRCLE, 16, 20, 5, -26, -15)
	scr_add_hurtbox(spr_bal_grab_side, 2, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 3, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 4, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 5, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 6, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 7, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 8, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 9, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 10, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 11, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 12, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 13, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_hurtbox(spr_bal_grab_side, 14, 0, CIRCLE, 15, 19, 2, -27, 0)
	scr_add_move(spr_bal_grab_side, 7, 0, CIRCLE, 5, 5, 18, -8, 0, 7, HOLD)
	scr_add_move(spr_bal_grab_side, 8, 0, CIRCLE, 5, 5, 18, -8, 0, 7, HOLD)
	scr_add_move(spr_bal_grab_side, 9, 0, CIRCLE, 5, 5, 18, -8, 0, 7, HOLD)
	scr_add_move(spr_bal_grab_side, 10, 0, CIRCLE, 5, 5, 18, -8, 0, 7, HOLD)
	scr_add_move(spr_bal_grab_side, 11, 0, CIRCLE, 5, 5, 18, -8, 0, 7, HOLD)

	//bal grab up (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_grab_up, 0, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_hurtbox(spr_bal_grab_up, 1, 0, CIRCLE, 16, 20, 9, -28, -45)
	scr_add_hurtbox(spr_bal_grab_up, 2, 0, CIRCLE, 15, 19, 12, -20, 0)
	scr_add_hurtbox(spr_bal_grab_up, 3, 0, CIRCLE, 16, 20, 10, -12, -45)
	scr_add_hurtbox(spr_bal_grab_up, 4, 0, CIRCLE, 15, 19, 1, -7, 0)
	scr_add_hurtbox(spr_bal_grab_up, 5, 0, CIRCLE, 16, 20, -7, -10, -45)
	scr_add_hurtbox(spr_bal_grab_up, 6, 0, CIRCLE, 15, 19, -10, -18, 0)
	scr_add_hurtbox(spr_bal_grab_up, 7, 0, CIRCLE, 16, 20, -6, -25, -45)
	scr_add_hurtbox(spr_bal_grab_up, 8, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_move(spr_bal_grab_up, 4, 0, CIRCLE, 18, 5, -6, -25, -15, 5, HOLD)
	scr_add_move(spr_bal_grab_up, 5, 0, CIRCLE, 17, 17, -5, -27, 0, 5, HOLD)
	scr_add_move(spr_bal_grab_up, 6, 0, CIRCLE, 12, 19, 3, -28, 0, 5, HOLD)
	scr_add_move(spr_bal_grab_up, 7, 0, CIRCLE, 18, 5, 12, -18, 15, 5, HOLD)

	//bal grab hold (no hitboxes)
	scr_add_hurtbox(spr_bal_grab_hold, 0, 0, CIRCLE, 15, 19, 7, -23, 0)
	scr_add_hurtbox(spr_bal_grab_hold, 1, 0, CIRCLE, 15, 19, 7, -22, 0)

	//bal grab jab (no hurtboxes, single point hitbox)
	scr_add_move(spr_bal_grab_jab, 2, 0, RECTANGLE, 1, 1, 23, -10, 0, 1, 0, 0, 0, -1)

	//bal throw forward (single point hitbox)
	scr_add_hurtbox(spr_bal_throw_forward, 0, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_forward, 1, 0, CIRCLE, 16, 20, -1, -19, 45)
	scr_add_hurtbox(spr_bal_throw_forward, 2, 0, CIRCLE, 19, 15, -4, -12, 0)
	scr_add_hurtbox(spr_bal_throw_forward, 3, 0, CIRCLE, 16, 20, 0, -5, 45)
	scr_add_hurtbox(spr_bal_throw_forward, 4, 0, CIRCLE, 15, 19, 7, -2, 0)
	scr_add_hurtbox(spr_bal_throw_forward, 5, 0, CIRCLE, 16, 20, 15, -6, 45)
	scr_add_hurtbox(spr_bal_throw_forward, 6, 0, CIRCLE, 19, 15, 18, -13, 0)
	scr_add_hurtbox(spr_bal_throw_forward, 7, 0, CIRCLE, 16, 20, 14, -21, 45)
	scr_add_hurtbox(spr_bal_throw_forward, 8, 0, CIRCLE, 15, 19, 7, -23, 0)
	scr_add_move(spr_bal_throw_forward, 0, 0, RECTANGLE, 1, 1, 23, -9, 0, 12, 0, 2, 5, 0)

	//bal throw up (single point hitbox)
	scr_add_hurtbox(spr_bal_throw_up, 0, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_up, 1, 0, CIRCLE, 16, 20, -1, -19, 45)
	scr_add_hurtbox(spr_bal_throw_up, 2, 0, CIRCLE, 19, 15, -4, -12, 0)
	scr_add_hurtbox(spr_bal_throw_up, 3, 0, CIRCLE, 16, 20, 0, -5, 45)
	scr_add_hurtbox(spr_bal_throw_up, 4, 0, CIRCLE, 15, 19, 7, -2, 0)
	scr_add_hurtbox(spr_bal_throw_up, 5, 0, CIRCLE, 16, 20, 15, -6, 45)
	scr_add_hurtbox(spr_bal_throw_up, 6, 0, CIRCLE, 19, 15, 18, -13, 0)
	scr_add_hurtbox(spr_bal_throw_up, 7, 0, CIRCLE, 16, 20, 14, -21, 45)
	scr_add_hurtbox(spr_bal_throw_up, 8, 0, CIRCLE, 15, 19, 7, -23, 0)
	scr_add_move(spr_bal_throw_up, 2, 0, RECTANGLE, 1, 1, 10, -19, 0, 9, 90, 9, 2, 0)

	//bal throw down (single point hitboxes)
	scr_add_hurtbox(spr_bal_throw_down, 0, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_down, 1, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_down, 2, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_down, 3, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_down, 4, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_hurtbox(spr_bal_throw_down, 5, 0, CIRCLE, 15, 19, 7, -26, 0)
	scr_add_hurtbox(spr_bal_throw_down, 6, 0, CIRCLE, 15, 19, 7, -29, 0)
	scr_add_hurtbox(spr_bal_throw_down, 7, 0, CIRCLE, 15, 19, 7, -26, 0)
	scr_add_hurtbox(spr_bal_throw_down, 8, 0, CIRCLE, 15, 19, 7, -23, 0)
	scr_add_hurtbox(spr_bal_throw_down, 9, 0, CIRCLE, 15, 19, 7, -23, 0)
	scr_add_hurtbox(spr_bal_throw_down, 10, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_move(spr_bal_throw_down, 4, 0, RECTANGLE, 1, 1, 13, 15, 0, 5, 270, 0, 0, -1)
	scr_add_move(spr_bal_throw_down, 8, 0, RECTANGLE, 1, 1, 7, 15, 0, 8, 270, 5, 9, 0)

	//bal throw back (single point hitboxes)
	scr_add_hurtbox(spr_bal_throw_back, 0, 0, CIRCLE, 15, 19, 7, -23, 0)
	scr_add_hurtbox(spr_bal_throw_back, 1, 0, CIRCLE, 16, 20, 14, -21, 45)
	scr_add_hurtbox(spr_bal_throw_back, 2, 0, CIRCLE, 19, 15, 18, -13, 0)
	scr_add_hurtbox(spr_bal_throw_back, 3, 0, CIRCLE, 16, 20, 15, -6, 45)
	scr_add_hurtbox(spr_bal_throw_back, 4, 0, CIRCLE, 15, 19, 7, -2, 0)
	scr_add_hurtbox(spr_bal_throw_back, 5, 0, CIRCLE, 16, 20, 0, -5, 45)
	scr_add_hurtbox(spr_bal_throw_back, 6, 0, CIRCLE, 19, 15, -4, -12, 0)
	scr_add_hurtbox(spr_bal_throw_back, 7, 0, CIRCLE, 16, 20, -1, -19, 45)
	scr_add_hurtbox(spr_bal_throw_back, 8, 0, CIRCLE, 15, 19, 7, -24, 0)
	scr_add_move(spr_bal_throw_back, 0, 0, RECTANGLE, 1, 1, 23, -9, 0, 7, 180, 2, 10, 0)

	//bal tilt up (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_tilt_up, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 1, 0, CIRCLE, 16, 20, 6, -25, -45)
	scr_add_hurtbox(spr_bal_tilt_up, 2, 0, CIRCLE, 19, 15, 11, -18, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 3, 0, CIRCLE, 20, 16, 9, -9, -45)
	scr_add_hurtbox(spr_bal_tilt_up, 4, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 5, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 6, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 7, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 8, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 9, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 10, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 11, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 12, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 13, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 14, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 15, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 16, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 17, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 18, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 19, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 20, 0, CIRCLE, 15, 19, 0, -8, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 21, 0, CIRCLE, 20, 16, 9, -9, -45)
	scr_add_hurtbox(spr_bal_tilt_up, 22, 0, CIRCLE, 19, 15, 11, -18, 0)
	scr_add_hurtbox(spr_bal_tilt_up, 23, 0, CIRCLE, 16, 20, 6, -25, -45)
	scr_add_hurtbox(spr_bal_tilt_up, 24, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_tilt_up, 4, 0, CIRCLE, 27, 10, 0, -30, 0, 2, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 5, 0, CIRCLE, 27, 10, 0, -30, 0, 2, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 6, 0, CIRCLE, 27, 10, 0, -30, 0, 2, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 7, 0, CIRCLE, 27, 10, 0, -30, 0, 2, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 9, 0, CIRCLE, 27, 10, 0, -30, 0, 1, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 10, 0, CIRCLE, 27, 10, 0, -30, 0, 1, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 11, 0, CIRCLE, 27, 10, 0, -30, 0, 1, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 13, 0, CIRCLE, 27, 10, 0, -30, 0, 3, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 14, 0, CIRCLE, 27, 10, 0, -30, 0, 3, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 15, 0, CIRCLE, 27, 10, 0, -30, 0, 3, 270, 1, 0, 2)
	scr_add_move(spr_bal_tilt_up, 17, 0, CIRCLE, 27, 10, 0, -30, 0, 4, 270, 3, 2, 2)
	scr_add_move(spr_bal_tilt_up, 18, 0, CIRCLE, 27, 10, 0, -30, 0, 4, 270, 3, 2, 2)
	scr_add_move(spr_bal_tilt_up, 19, 0, CIRCLE, 27, 10, 0, -30, 0, 4, 270, 3, 2, 2)

	//bal tilt down (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_tilt_down, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 1, 0, CIRCLE, 16, 20, 1, -17, -45)
	scr_add_hurtbox(spr_bal_tilt_down, 2, 0, CIRCLE, 19, 15, 2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 3, 0, CIRCLE, 19, 15, 2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 4, 0, CIRCLE, 19, 15, 2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 5, 0, CIRCLE, 19, 15, 2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 6, 0, CIRCLE, 19, 15, 2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 7, 0, CIRCLE, 19, 15, 2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 8, 0, CIRCLE, 16, 20, 1, -14, -45)
	scr_add_hurtbox(spr_bal_tilt_down, 10, 0, CIRCLE, 15, 19, 0, -20, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 11, 0, CIRCLE, 16, 20, 0, -14, 45)
	scr_add_hurtbox(spr_bal_tilt_down, 12, 0, CIRCLE, 19, 15, -2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 13, 0, CIRCLE, 19, 15, -2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 14, 0, CIRCLE, 19, 15, -2, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 15, 0, CIRCLE, 16, 20, 0, -14, 45)
	scr_add_hurtbox(spr_bal_tilt_down, 16, 0, CIRCLE, 15, 19, 0, -21, 0)
	scr_add_hurtbox(spr_bal_tilt_down, 17, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_tilt_down, 3, 0, CIRCLE, 19, 8, -18, -4, 0, 8, 160, 2, 4)
	scr_add_move(spr_bal_tilt_down, 4, 0, CIRCLE, 20, 18, -24, -8, 0, 9, 160, 2, 4)
	scr_add_move(spr_bal_tilt_down, 6, 0, CIRCLE, 20, 18, -24, -8, 0, 10, 200, 2, 4)
	scr_add_move(spr_bal_tilt_down, 12, 0, CIRCLE, 20, 14, 21, -6, 0, 6, 20, 2, 4)
	scr_add_move(spr_bal_tilt_down, 14, 0, CIRCLE, 20, 14, 21, -6, 0, 12, 340, 2, 4)

	//bal tilt forward (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_tilt_forward, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_tilt_forward, 1, 0, CIRCLE, 16, 20, 9, -21, 45)
	scr_add_hurtbox(spr_bal_tilt_forward, 2, 0, CIRCLE, 19, 15, 12, -15, 0)
	scr_add_hurtbox(spr_bal_tilt_forward, 3, 0, CIRCLE, 19, 15, 18, -11, 0)
	scr_add_hurtbox(spr_bal_tilt_forward, 4, 0, CIRCLE, 19, 15, 19, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_forward, 5, 0, CIRCLE, 19, 15, 13, -7, 0)
	scr_add_hurtbox(spr_bal_tilt_forward, 6, 0, CIRCLE, 16, 20, 6, -12, 45)
	scr_add_hurtbox(spr_bal_tilt_forward, 7, 0, CIRCLE, 15, 19, 3, -21, 0)
	scr_add_hurtbox(spr_bal_tilt_forward, 8, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_tilt_forward, 2, 0, CIRCLE, 15, 15, 35, -15, 0, 13, 0, 4, 3)
	scr_add_move(spr_bal_tilt_forward, 3, 0, CIRCLE, 15, 15, 41, -11, 0, 13, 0, 4, 3)
	scr_add_move(spr_bal_tilt_forward, 4, 0, CIRCLE, 15, 15, 42, -7, 0, 13, 0, 4, 3)

	//bal jab 1 (single hitbox)
	scr_add_hurtbox(spr_bal_jab_1, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_1, 1, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_1, 2, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_1, 3, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_1, 4, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_1, 5, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_1, 6, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_jab_1, 4, 0, CIRCLE, 5, 5, 14, -13, 0, 3, 0, 0, 0.5)

	//bal jab 2 (single hitbox)
	scr_add_hurtbox(spr_bal_jab_2, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_2, 1, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_2, 2, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_2, 3, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_2, 4, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_2, 5, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_2, 6, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_jab_2, 4, 0, CIRCLE, 5, 5, 16, -14, 0, 2, 0, 0, 0.25)

	//bal jab 3 (single hitbox)
	scr_add_hurtbox(spr_bal_jab_3, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_3, 1, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_3, 2, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_3, 3, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_3, 4, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_3, 5, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_jab_3, 6, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_jab_3, 4, 0, CIRCLE, 5, 5, 18, -12, 0, 5, 0, 2, 3)

	//bal dash attack (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_dash_attack, 0, 0, CIRCLE, 16, 20, 16, -18, -45)
	scr_add_hurtbox(spr_bal_dash_attack, 1, 0, CIRCLE, 19, 15, 29, -11, 0)
	scr_add_hurtbox(spr_bal_dash_attack, 2, 0, CIRCLE, 19, 15, 30, -8, 0)
	scr_add_hurtbox(spr_bal_dash_attack, 3, 0, CIRCLE, 19, 15, 30, -8, 0)
	scr_add_hurtbox(spr_bal_dash_attack, 4, 0, CIRCLE, 19, 15, 30, -8, 0)
	scr_add_hurtbox(spr_bal_dash_attack, 5, 0, CIRCLE, 19, 15, 30, -8, 0)
	scr_add_hurtbox(spr_bal_dash_attack, 6, 0, CIRCLE, 16, 20, 16, -18, -45)
	scr_add_hurtbox(spr_bal_dash_attack, 7, 0, CIRCLE, 16, 20, 12, -23, -30)
	scr_add_hurtbox(spr_bal_dash_attack, 8, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_dash_attack, 1, 0, CIRCLE, 19, 15, 29, -11, 0, 9, 0, 3, 2)
	scr_add_move(spr_bal_dash_attack, 2, 0, CIRCLE, 19, 15, 30, -8, 0, 9, 0, 3, 2)
	scr_add_move(spr_bal_dash_attack, 3, 0, CIRCLE, 19, 15, 30, -8, 0, 8, 0, 3, 1)
	scr_add_move(spr_bal_dash_attack, 4, 0, CIRCLE, 19, 15, 30, -8, 0, 7, 0, 2, 1)
	scr_add_move(spr_bal_dash_attack, 5, 0, CIRCLE, 19, 15, 30, -8, 0, 6, 0, 2, 1)

	//spr bal aerial forward (discontinuous hitboxes)
	for (i = 0; i < 22; i++) { //loop through all sub-images
		if ((i mod 21) < 2) { //first 2 or last 2 frames
			scr_add_hurtbox(spr_bal_aerial_forward, i, 0, CIRCLE, 15, 19, 2, -31, 0)
		} else { //all other frames
			scr_add_hurtbox(spr_bal_aerial_forward, i, 0, CIRCLE, 16, 20, -5, -27, 45)
		}
	}
	scr_add_move(spr_bal_aerial_forward, 3, 0, CIRCLE, 22, 30, 10, -13, -10, 3, 160, 1, 0)
	scr_add_move(spr_bal_aerial_forward, 4, 0, CIRCLE, 22, 30, 10, -13, -10, 3, 160, 1, 0)
	scr_add_move(spr_bal_aerial_forward, 6, 0, CIRCLE, 22, 30, 10, -13, -10, 2, 160, 0.9, 0)
	scr_add_move(spr_bal_aerial_forward, 7, 0, CIRCLE, 22, 30, 10, -13, -10, 2, 160, 0.9, 0)
	scr_add_move(spr_bal_aerial_forward, 9, 0, CIRCLE, 22, 30, 10, -13, -10, 1, 160, 0.8, 0)
	scr_add_move(spr_bal_aerial_forward, 10, 0, CIRCLE, 22, 30, 10, -13, -10, 1, 160, 0.8, 0)
	scr_add_move(spr_bal_aerial_forward, 12, 0, CIRCLE, 22, 30, 10, -13, -10, 1, 160, 0.7, 0)
	scr_add_move(spr_bal_aerial_forward, 13, 0, CIRCLE, 22, 30, 10, -13, -10, 1, 160, 0.7, 0)
	scr_add_move(spr_bal_aerial_forward, 15, 0, CIRCLE, 22, 30, 10, -13, -10, 1, 160, 0.5, 0)
	scr_add_move(spr_bal_aerial_forward, 16, 0, CIRCLE, 22, 30, 10, -13, -10, 1, 160, 0.5, 0)
	scr_add_move(spr_bal_aerial_forward, 18, 0, CIRCLE, 22, 30, 10, -13, -10, 3, 160, 2, 3)
	scr_add_move(spr_bal_aerial_forward, 19, 0, CIRCLE, 22, 30, 10, -13, -10, 3, 160, 2, 3)

	//spr bal aerial down (discontinuous hitboxes)
	for (i = 0; i < 12; i++) { //for each subimage
		scr_add_hurtbox(spr_bal_aerial_down, i, 0, CIRCLE, 15, 19, 2, -31, 0)
	}
	scr_add_move(spr_bal_aerial_down, 7, 0, CIRCLE, 5, 5, 2, -1, 0, 16, 270, 3, 2)
	scr_add_move(spr_bal_aerial_down, 7, 1, CIRCLE, 11, 15, 7, -9, 0, 16, 0, 2, 1)
	scr_add_move(spr_bal_aerial_down, 8, 0, CIRCLE, 8, 8, 2, 7, 0, 16, 270, 2, 1)
	scr_add_move(spr_bal_aerial_down, 8, 1, CIRCLE, 1, 1, 2, 7, 0, 16, 270, 8, 4, 5)
	scr_add_move(spr_bal_aerial_down, 9, 0, CIRCLE, 3, 3, 2, 7, 0, 16, 270, 3, 1)
	scr_add_move(spr_bal_aerial_down, 10, 0, CIRCLE, 2, 2, 2, 5, 0, 16, 270, 1, 1)

	//spr bal aerial up (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_aerial_up, 0, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 1, 0, CIRCLE, 11, 15, 2, -32, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 2, 0, CIRCLE, 7, 11, 2, -34, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 3, 0, CIRCLE, 9, 8, 2, -35, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 4, 0, CIRCLE, 9, 8, 2, -35, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 5, 0, CIRCLE, 7, 11, 2, -34, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 6, 0, CIRCLE, 11, 15, 2, -32, 0)
	scr_add_hurtbox(spr_bal_aerial_up, 7, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_move(spr_bal_aerial_up, 2, 0, CIRCLE, 8, 13, 2, -21, 0, 14, 270, 4, 3)
	scr_add_move(spr_bal_aerial_up, 3, 0, CIRCLE, 13, 30, 2, -17, 0, 14, 270, 4, 3)
	scr_add_move(spr_bal_aerial_up, 4, 0, CIRCLE, 8, 30, 2, -17, 0, 10, 270, 1, 1)

	//bal aerial back (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_aerial_back, 0, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 1, 0, CIRCLE, 16, 20, 3, -27, 45)
	scr_add_hurtbox(spr_bal_aerial_back, 2, 0, CIRCLE, 16, 20, 7, -30, 45)
	scr_add_hurtbox(spr_bal_aerial_back, 3, 0, CIRCLE, 19, 15, 8, -33, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 4, 0, CIRCLE, 19, 15, 8, -36, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 5, 0, CIRCLE, 20, 16, 9, -41, 45)
	scr_add_hurtbox(spr_bal_aerial_back, 6, 0, CIRCLE, 20, 16, 7, -43, 45)
	scr_add_hurtbox(spr_bal_aerial_back, 7, 0, CIRCLE, 15, 19, 5, -42, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 8, 0, CIRCLE, 15, 19, 3, -42, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 9, 0, CIRCLE, 16, 20, 0, -34, 45)
	scr_add_hurtbox(spr_bal_aerial_back, 10, 0, CIRCLE, 15, 19, -1, -28, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 11, 0, CIRCLE, 20, 16, -1, -20, 45)
	scr_add_hurtbox(spr_bal_aerial_back, 12, 0, CIRCLE, 15, 19, 2, -24, 0)
	scr_add_hurtbox(spr_bal_aerial_back, 13, 0, CIRCLE, 15, 19, 1, -31, 0)
	scr_add_move(spr_bal_aerial_back, 9, 0, CIRCLE, 30, 30, -10, -64, 0, 12, 270, 2, 3)
	scr_add_move(spr_bal_aerial_back, 10, 0, CIRCLE, 22, 38, -26, -44, 0, 12, 270, 2, 3)
	scr_add_move(spr_bal_aerial_back, 10, 1, CIRCLE, 2, 2, -36, -31, 0, 12, 270, 4, 16)
	scr_add_move(spr_bal_aerial_back, 11, 0, CIRCLE, 15, 30, -26, -15, 30, 12, 270, 3, 8)

	//bal aerial neutral (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_aerial_neutral, 0, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_hurtbox(spr_bal_aerial_neutral, 1, 0, CIRCLE, 16, 20, 9, -28, -45)
	for (i = 0; i < 4; i++) { //loop for each frame cycle repetition
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 2, 0, CIRCLE, 19, 15, 12, -20, 0)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 3, 0, CIRCLE, 20, 16, 10, -11, -45)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 4, 0, CIRCLE, 15, 19, 1, -7, 0)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 5, 0, CIRCLE, 20, 16, -7, -9, 45)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 6, 0, CIRCLE, 19, 16, -10, -18, 0)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 7, 0, CIRCLE, 16, 20, -7, -26, 45)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 8, 0, CIRCLE, 15, 16, 2, -31, 0)
		scr_add_hurtbox(spr_bal_aerial_neutral, i*8 + 9, 0, CIRCLE, 16, 20, 9, -28, -45)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 2, 0, CIRCLE, 16, 21, -2, -10, 0, 1, 135, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 3, 0, CIRCLE, 16, 21, -4, -13, 0, 1, 90, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 4, 0, CIRCLE, 16, 21, -5, -18, 0, 1, 45, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 5, 0, CIRCLE, 16, 21, -5, -23, 0, 1, 0, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 6, 0, CIRCLE, 16, 21, 4, -28, 0, 1, 315, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 7, 0, CIRCLE, 16, 21, 11, -23, 0, 1, 270, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 8, 0, CIRCLE, 16, 21, 11, -11, 0, 1, 225, 2, 0)
		scr_add_move(spr_bal_aerial_neutral, i*8 + 9, 0, CIRCLE, 16, 21, 3, -8, 0, 1, 180, 2, 0)
	}
	scr_add_move(spr_bal_aerial_neutral, 33, 0, NULL, -10, -10, -10, -10, -10, -10, -10, -10, -10) //remove last hitbox
	scr_add_hurtbox(spr_bal_aerial_neutral, 0, 0, CIRCLE, 15, 19, 2, -31, 0) //over-write the last hurtbox

	//bal smash forward (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_smash_forward, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 1, 0, CIRCLE, 16, 20, -9, -25, 45)
	scr_add_hurtbox(spr_bal_smash_forward, 2, 0, CIRCLE, 15, 19, 3, -31, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 3, 0, CIRCLE, 16, 20, 20, -25, -45)
	scr_add_hurtbox(spr_bal_smash_forward, 4, 0, CIRCLE, 19, 15, 34, -18, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 5, 0, CIRCLE, 19, 15, 47, -14, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 6, 0, CIRCLE, 19, 15, 60, -9, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 7, 0, CIRCLE, 19, 15, 69, -7, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 8, 0, CIRCLE, 19, 15, 73, -7, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 9, 0, CIRCLE, 19, 15, 75, -7, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 10, 0, CIRCLE, 19, 15, 76, -7, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 11, 0, CIRCLE, 20, 16, 79, -10, 45)
	scr_add_hurtbox(spr_bal_smash_forward, 12, 0, CIRCLE, 15, 19, 84, -18, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 13, 0, CIRCLE, 15, 19, 86, -23, 0)
	scr_add_hurtbox(spr_bal_smash_forward, 14, 0, CIRCLE, 15, 19, 88, -27, 0)
	for (var i = 0; i < 2; i++) {
		scr_add_move(spr_bal_smash_forward, i, 0, CIRCLE, 30, 30, -2, -28, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_bal_smash_forward, 2, 0, CIRCLE, 29, 29, -2, -28, 0, 23, 340, 4, 9)
	scr_add_move(spr_bal_smash_forward, 3, 0, CIRCLE, 25, 20, 14, -28, 0, 17, 340, 3, 5)
	scr_add_move(spr_bal_smash_forward, 4, 0, CIRCLE, 26, 11, 26, -25, -30, 14, 340, 2, 4)
	scr_add_move(spr_bal_smash_forward, 5, 0, CIRCLE, 10, 10, 44, -20, 0, 11, 340, 2, 3)
	scr_add_move(spr_bal_smash_forward, 6, 0, CIRCLE, 5, 5, 65, -9, 0, 8, 0, 1, 3)

	//bal smash down (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_smash_down, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_smash_down, 1, 0, CIRCLE, 16, 20, -9, -25, 45)
	scr_add_hurtbox(spr_bal_smash_down, 2, 0, CIRCLE, 15, 19, 3, -31, 0)
	scr_add_hurtbox(spr_bal_smash_down, 3, 0, CIRCLE, 16, 20, 17, -20, -45)
	scr_add_hurtbox(spr_bal_smash_down, 4, 0, CIRCLE, 19, 15, 29, -7, 0)
	scr_add_hurtbox(spr_bal_smash_down, 5, 0, CIRCLE, 19, 15, 29, -7, 0)
	scr_add_hurtbox(spr_bal_smash_down, 6, 0, CIRCLE, 16, 20, 17, -20, -45)
	scr_add_hurtbox(spr_bal_smash_down, 7, 0, CIRCLE, 15, 19, 0, -31, 0)
	scr_add_hurtbox(spr_bal_smash_down, 8, 0, CIRCLE, 16, 20, -17, -20, 45)
	scr_add_hurtbox(spr_bal_smash_down, 9, 0, CIRCLE, 19, 15, -29, -7, 0)
	scr_add_hurtbox(spr_bal_smash_down, 10, 0, CIRCLE, 19, 15, -29, -7, 0)
	scr_add_hurtbox(spr_bal_smash_down, 11, 0, CIRCLE, 16, 20, -17, -20, 45)
	scr_add_hurtbox(spr_bal_smash_down, 12, 0, CIRCLE, 15, 19, 0, -31, 0)
	scr_add_hurtbox(spr_bal_smash_down, 13, 0, CIRCLE, 15, 19, 0, -27, 0)
	for (var i = 0; i < 2; i++) {
		scr_add_move(spr_bal_smash_down, i, 0, CIRCLE, 30, 30, -5, -30, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_bal_smash_down, 2, 0, CIRCLE, 28, 20, -5, -30, 0, 13, 200, 3, 4)
	scr_add_move(spr_bal_smash_down, 3, 0, CIRCLE, 40, 27, 8, -25, 0, 13, 210, 3, 2)
	scr_add_move(spr_bal_smash_down, 4, 0, CIRCLE, 36, 36, 22, -17, 0, 13, 180, 4, 3)
	scr_add_move(spr_bal_smash_down, 8, 0, CIRCLE, 50, 36, -4, -24, 0, 9, 200, 4, 5)
	scr_add_move(spr_bal_smash_down, 9, 0, CIRCLE, 32, 40, -24, -11, 0, 9, 200, 4, 5)

	//bal smash up (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_smash_up, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_smash_up, 1, 0, CIRCLE, 15, 19, 0, -23, 0)
	scr_add_hurtbox(spr_bal_smash_up, 2, 0, CIRCLE, 15, 19, 0, -19, 0)
	scr_add_hurtbox(spr_bal_smash_up, 3, 0, CIRCLE, 15, 19, 0, -18, 0)
	scr_add_hurtbox(spr_bal_smash_up, 4, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_smash_up, 5, 0, CIRCLE, 15, 19, 0, -39, 0)
	scr_add_hurtbox(spr_bal_smash_up, 6, 0, CIRCLE, 15, 19, 0, -37, 0)
	scr_add_hurtbox(spr_bal_smash_up, 7, 0, CIRCLE, 15, 19, 0, -33, 0)
	scr_add_hurtbox(spr_bal_smash_up, 8, 0, CIRCLE, 15, 19, 0, -27, 0)
	for (var i = 0; i < 4; i++) {
		scr_add_move(spr_bal_smash_up, i, 0, CIRCLE, 30, 30, 0, -20, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_bal_smash_up, 4, 0, CIRCLE, 20, 30, 0, -20, 0, 18, 90, 3, 4)
	scr_add_move(spr_bal_smash_up, 5, 0, CIRCLE, 18, 38, 0, -30, 0, 26, 90, 6, 5)

	//bal special forward (discontinuous hitboxes)
	scr_add_hurtbox(spr_bal_special_forward, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_special_forward, 23, 0, CIRCLE, 15, 19, 0, -27, 0)
	for (i = 0; i < 22; i++) { //loop through all bar 2 sub-images
		scr_add_hurtbox(spr_bal_special_forward, i + 1, 0, CIRCLE, 16, 20, -15, -24, 45)
	}
	scr_add_move(spr_bal_special_forward, 3, 0, CIRCLE, 10, 10, 18, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 4, 0, CIRCLE, 10, 10, 28, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 5, 0, CIRCLE, 10, 10, 39, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 6, 0, CIRCLE, 10, 10, 53, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 7, 0, CIRCLE, 10, 10, 67, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 8, 0, CIRCLE, 10, 10, 82, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 9, 0, CIRCLE, 10, 10, 95, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 10, 0, CIRCLE, 10, 10, 110, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 11, 0, CIRCLE, 10, 10, 122, -10, 0, 0, HOLD)
	scr_add_move(spr_bal_special_forward, 12, 0, CIRCLE, 10, 10, 132, -10, 0, 0, HOLD)

	//bal special down (discontinuous hitbox)
	scr_add_hurtbox(spr_bal_special_down, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_special_down, 1, 0, CIRCLE, 12, 15, 0, -27, 0)
	scr_add_hurtbox(spr_bal_special_down, 2, 0, CIRCLE, 7, 11, 0, -34, 0)
	scr_add_hurtbox(spr_bal_special_down, 3, 0, CIRCLE, 9, 8, 0, -41, 0)
	scr_add_hurtbox(spr_bal_special_down, 4, 0, CIRCLE, 9, 8, 0, -46, 0)
	scr_add_hurtbox(spr_bal_special_down, 5, 0, CIRCLE, 7, 11, 0, -52, 0)
	scr_add_hurtbox(spr_bal_special_down, 6, 0, CIRCLE, 13, 17, 0, -52, 0)
	scr_add_hurtbox(spr_bal_special_down, 7, 0, CIRCLE, 15, 19, 0, -56, 0)
	scr_add_move(spr_bal_special_down, 3, 0, RECTANGLE, 31, 7, 15, -4, 0, 0, 0, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 3, 1, RECTANGLE, 31, 7, -15, -4, 0, 0, 180, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 4, 0, RECTANGLE, 47, 13, 24, -6, 0, 0, 0, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 4, 1, RECTANGLE, 47, 13, -24, -6, 0, 0, 180, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 5, 0, RECTANGLE, 58, 18, 29, -9, 0, 0, 0, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 5, 1, RECTANGLE, 58, 18, -29, -9, 0, 0, 180, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 6, 0, CIRCLE, 33, 33, -58, -14, 0, 0, 180, 6, 2, 0)
	scr_add_move(spr_bal_special_down, 6, 1, CIRCLE, 33, 33, 58, -13, 0, 0, 0, 6, 2, 0)

	//bal special up (discontinuous hitbox)
	for (i = 0; i < 12; i++) { //for all similair frames
		scr_add_hurtbox(spr_bal_special_up, i + 6, 0, CIRCLE, 15, 19, 1, -12, 0)
		scr_add_move(spr_bal_special_up, i + 6, 0, CIRCLE, 25, 7, 1, -30, 0, 4, 90, 1, 1)
		scr_add_move(spr_bal_special_up, i + 6, 1, RECTANGLE, 25, 75, 1, -35, 0, 0, 90, 5, 1, 0)
	}
	scr_add_hurtbox(spr_bal_special_up, 0, 0, CIRCLE, 15, 19, 2, -31, 0)
	scr_add_hurtbox(spr_bal_special_up, 1, 0, CIRCLE, 16, 20, 9, -29, -45)
	scr_add_hurtbox(spr_bal_special_up, 2, 0, CIRCLE, 19, 15, 12, -23, 0)
	scr_add_hurtbox(spr_bal_special_up, 3, 0, CIRCLE, 16, 20, 9, -27, 45)
	scr_add_hurtbox(spr_bal_special_up, 4, 0, CIRCLE, 15, 19, 1, -12, 0)
	scr_add_hurtbox(spr_bal_special_up, 5, 0, CIRCLE, 15, 19, 1, -12, 0)
	scr_add_hurtbox(spr_bal_special_up, 18, 0, CIRCLE, 16, 20, -7, -17, -45)
	scr_add_hurtbox(spr_bal_special_up, 19, 0, CIRCLE, 19, 15, -10, -21, 0)
	scr_add_hurtbox(spr_bal_special_up, 20, 0, CIRCLE, 16, 20, -6, -30, 45)
	scr_add_hurtbox(spr_bal_special_up, 21, 0, CIRCLE, 15, 19, 2, -39, 0)

	//bal special neutral
	scr_add_hurtbox(spr_bal_special_neutral, 0, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 1, 0, CIRCLE, 16, 20, -9, -24, 45)
	scr_add_hurtbox(spr_bal_special_neutral, 2, 0, CIRCLE, 19, 15, -15, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 3, 0, CIRCLE, 15, 11, -12, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 4, 0, CIRCLE, 15, 11, -12, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 5, 0, CIRCLE, 12, 7, -10, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 6, 0, CIRCLE, 9, 9, -7, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 7, 0, CIRCLE, 9, 9, -7, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 8, 0, CIRCLE, 12, 7, -10, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 9, 0, CIRCLE, 15, 11, -12, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 10, 0, CIRCLE, 15, 11, -12, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 11, 0, CIRCLE, 19, 15, -15, -15, 0)
	scr_add_hurtbox(spr_bal_special_neutral, 12, 0, CIRCLE, 16, 20, -9, -24, 45)
	scr_add_hurtbox(spr_bal_special_neutral, 13, 0, CIRCLE, 15, 19, 0, -27, 0)
	scr_add_move(spr_bal_special_neutral, 4, 0, RECTANGLE, 20, 8, 6, -15, 0, 0, 0, 7, 3, 0)
	scr_add_move(spr_bal_special_neutral, 5, 0, RECTANGLE, 30, 10, 13, -15, 0, 0, 0, 7, 3, 0)
	scr_add_move(spr_bal_special_neutral, 6, 0, RECTANGLE, 46, 17, 21, -15, 0, 0, 0, 7, 3, 0)
	scr_add_move(spr_bal_special_neutral, 7, 0, RECTANGLE, 35, 10, 17, -15, 0, 0, 0, 7, 3, 0)
#endregion BALLOONY

window_set_caption("Adding Hitboxes Into Memory MAC")

#region MACHINATION 451 lines
	//mac idle (no hitboxes)
	scr_add_hurtbox(spr_mac_idle, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_idle, 1, 0, RECTANGLE, 12, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_idle, 2, 0, RECTANGLE, 12, 16, -1, -21, 0)
	scr_add_hurtbox(spr_mac_idle, 3, 0, RECTANGLE, 12, 16, -2, -20, 0)
	scr_add_hurtbox(spr_mac_idle, 4, 0, RECTANGLE, 12, 16, -3, -19, 0)
	scr_add_hurtbox(spr_mac_idle, 5, 0, RECTANGLE, 12, 16, -2, -20, 0)
	scr_add_hurtbox(spr_mac_idle, 6, 0, RECTANGLE, 12, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_idle, 7, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac walk, mac run (same hurtboxes, no hitboxes)
	for (i = 0; i < 12; i ++) {
		scr_add_hurtbox(spr_mac_walk, i, 0, RECTANGLE, 12, 16, 2, -18, 0)
		scr_add_hurtbox(spr_mac_run, i, 0, RECTANGLE, 12, 16, 2, -18, 0)
	}

	//mac speed up (no hitboxes)
	scr_add_hurtbox(spr_mac_speed_up, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_speed_up, 1, 0, RECTANGLE, 12, 16, 2, -18, 0)

	//mac speed down (no hitboxes)
	scr_add_hurtbox(spr_mac_speed_down, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_speed_down, 1, 0, RECTANGLE, 12, 16, 2, -18, 0)

	//mac dash (no hitboxes)
	scr_add_hurtbox(spr_mac_dash, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_dash, 1, 0, RECTANGLE, 12, 16, 2, -18, 0)

	//mac dash slow (no hitboxes)
	scr_add_hurtbox(spr_mac_dash_slow, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_dash_slow, 1, 0, RECTANGLE, 12, 16, 2, -18, 0)

	//mac jump (no hitboxes)
	scr_add_hurtbox(spr_mac_jump, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_jump, 1, 0, RECTANGLE, 12, 16, 2, -19, 0)
	scr_add_hurtbox(spr_mac_jump, 2, 0, RECTANGLE, 12, 16, 2, -19, 0)
	scr_add_hurtbox(spr_mac_jump, 3, 0, RECTANGLE, 12, 16, 2, -19, 0)
	scr_add_hurtbox(spr_mac_jump, 4, 0, RECTANGLE, 12, 16, 2, -20, 0)
	scr_add_hurtbox(spr_mac_jump, 5, 0, RECTANGLE, 12, 16, 2, -20, 0)
	scr_add_hurtbox(spr_mac_jump, 6, 0, RECTANGLE, 11, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_jump, 7, 0, RECTANGLE, 11, 16, 0, -20, 0)

	//mac air move (no hitboxes)
	scr_add_hurtbox(spr_mac_air_move, 0, 0, RECTANGLE, 11, 16, 0, -20, 0)

	//mac air dodge (no hitboxes, no hurtboxes)

	//mac land (no hitboxes)
	scr_add_hurtbox(spr_mac_land, 0, 0, RECTANGLE, 11, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_land, 1, 0, RECTANGLE, 11, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_land, 2, 0, RECTANGLE, 12, 16, 2, -20, 0)
	scr_add_hurtbox(spr_mac_land, 3, 0, RECTANGLE, 12, 16, 2, -20, 0)
	scr_add_hurtbox(spr_mac_land, 4, 0, RECTANGLE, 12, 16, 2, -19, 0)
	scr_add_hurtbox(spr_mac_land, 5, 0, RECTANGLE, 12, 16, 2, -19, 0)
	scr_add_hurtbox(spr_mac_land, 6, 0, RECTANGLE, 12, 16, 2, -19, 0)
	scr_add_hurtbox(spr_mac_land, 7, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac shield (no hitboxes)
	scr_add_hurtbox(spr_mac_shield, 0, 0, RECTANGLE, 12, 16, 1, -17, 0)
	scr_add_hurtbox(spr_mac_shield, 1, 0, RECTANGLE, 12, 16, 1, -17, 0)
	scr_add_hurtbox(spr_mac_shield, 2, 0, RECTANGLE, 12, 16, 1, -18, 0)
	scr_add_hurtbox(spr_mac_shield, 3, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac hold shield (no hitboxes)
	scr_add_hurtbox(spr_mac_hold_shield, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_hold_shield, 1, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac un shield (no hitboxes)
	scr_add_hurtbox(spr_mac_un_shield, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_un_shield, 1, 0, RECTANGLE, 12, 16, 1, -18, 0)
	scr_add_hurtbox(spr_mac_un_shield, 2, 0, RECTANGLE, 12, 16, 1, -17, 0)
	scr_add_hurtbox(spr_mac_un_shield, 3, 0, RECTANGLE, 12, 16, 1, -17, 0)

	//mac roll (no hitboxes, discontinuous hurtboxes)
	scr_add_hurtbox(spr_mac_roll, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_roll, 1, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_roll, 8, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_roll, 9, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac dodge (no hitboxes, discontinuous hurtboxes)
	scr_add_hurtbox(spr_mac_dodge, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_dodge, 1, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_dodge, 8, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_dodge, 9, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac ledge (no hitboxes)
	scr_add_hurtbox(spr_mac_ledge, 0, 0, RECTANGLE, 12, 15, -17, 16, 0)
	scr_add_hurtbox(spr_mac_ledge, 1, 0, RECTANGLE, 12, 15, -17, 16, 0)

	//mac ledge hold (no hitboxes, no hurtboxes)

	//mac ledge roll (no hitboxes, no hurtboxes)

	//mac ledge jump (no hitboxes, no hurtboxes)

	//mac ledge grab (discontinuous hitboxes, no hurtboxes)
	scr_add_move(spr_mac_ledge_grab, 10, 0, CIRCLE, 10, 10, 3, -7, 0, 0, HOLD)
	scr_add_move(spr_mac_ledge_grab, 11, 0, CIRCLE, 10, 10, 9, -12, 0, 0, HOLD)
	scr_add_move(spr_mac_ledge_grab, 12, 0, CIRCLE, 10, 10, 15, -16, 0, 0, HOLD)
	scr_add_move(spr_mac_ledge_grab, 13, 0, CIRCLE, 10, 10, 20, -20, 0, 0, HOLD)
	scr_add_move(spr_mac_ledge_grab, 14, 0, CIRCLE, 10, 10, 24, -20, 0, 0, HOLD)

	//mac ledge attack (discontinuous hitboxes, no hurtboxes)
	scr_add_move(spr_mac_ledge_attack, 4, 0, RECTANGLE, 25, 16, -14, 21, 0, 16, 90, 8, 3)
	scr_add_move(spr_mac_ledge_attack, 5, 0, RECTANGLE, 25, 19, -14, 18, 0, 16, 90, 8, 3)
	scr_add_move(spr_mac_ledge_attack, 6, 0, RECTANGLE, 25, 23, -14, 15, 0, 16, 90, 8, 3)
	scr_add_move(spr_mac_ledge_attack, 7, 0, RECTANGLE, 25, 24, -14, 14, 0, 16, 90, 8, 3)
	scr_add_move(spr_mac_ledge_attack, 8, 0, RECTANGLE, 20, 22, -12, 11, 0, 16, 90, 8, 3)
	scr_add_move(spr_mac_ledge_attack, 9, 0, RECTANGLE, 12, 19, -11, 4, 0, 16, 90, 8, 3)
	scr_add_move(spr_mac_ledge_attack, 13, 0, CIRCLE, 6, 6, 27, -22, 0, 12, 0, 4, 2)
	scr_add_move(spr_mac_ledge_attack, 14, 0, CIRCLE, 15, 15, 27, -22, 0, 12, 0, 4, 2)
	scr_add_move(spr_mac_ledge_attack, 15, 0, CIRCLE, 23, 12, 34, -21, 0, 12, 0, 4, 2)
	scr_add_move(spr_mac_ledge_attack, 16, 0, CIRCLE, 18, 26, 34, -21, 0, 12, 0, 4, 2)
	scr_add_move(spr_mac_ledge_attack, 17, 0, CIRCLE, 18, 26, 34, -21, 0, 12, 0, 4, 2)
	scr_add_move(spr_mac_ledge_attack, 18, 0, CIRCLE, 12, 26, 34, -21, 0, 12, 0, 4, 2)

	//mac hurt up (no hitboxes)
	scr_add_hurtbox(spr_mac_hurt_up, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac hurt side (no hitboxes)
	scr_add_hurtbox(spr_mac_hurt_side, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)

	//mac hurt down (no hitboxes)
	scr_add_hurtbox(spr_mac_hurt_down, 0, 0, RECTANGLE, 16, 12, 0, -5, 0)

	//mac grabbed (no hitboxes)
	scr_add_hurtbox(spr_mac_grabbed, 0, 0, RECTANGLE, 12, 16, -4, -1, 0)
	scr_add_hurtbox(spr_mac_grabbed, 0, 1, RECTANGLE, 2, 2, 0, 0, 0)

	//mac taunt (no hitboxes)
	for (i = 0; i < 19; i++) {
		scr_add_hurtbox(spr_mac_taunt, i, 0, RECTANGLE, 12, 16, 1, -19, 0)	
	}

	//mac crouch (no hitboxes)
	scr_add_hurtbox(spr_mac_crouch, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)	
	scr_add_hurtbox(spr_mac_crouch, 1, 0, RECTANGLE, 12, 16, 1, -15, 0)	
	scr_add_hurtbox(spr_mac_crouch, 2, 0, RECTANGLE, 12, 16, 1, -8, 0)	
	scr_add_hurtbox(spr_mac_crouch, 3, 0, RECTANGLE, 12, 12, 1, -6, 0)	

	//mac crouch hold (no hitboxes)
	scr_add_hurtbox(spr_mac_crouch_hold, 0, 0, RECTANGLE, 12, 12, 1, -6, 0)	
	scr_add_hurtbox(spr_mac_crouch_hold, 1, 0, RECTANGLE, 12, 12, 1, -6, 0)	
	scr_add_hurtbox(spr_mac_crouch_hold, 2, 0, RECTANGLE, 12, 12, 1, -6, 0)

	//mac crouch end (no hitboxes)
	scr_add_hurtbox(spr_mac_crouch, 0, 0, RECTANGLE, 12, 12, 1, -6, 0)	
	scr_add_hurtbox(spr_mac_crouch, 1, 0, RECTANGLE, 12, 16, 1, -8, 0)	
	scr_add_hurtbox(spr_mac_crouch, 2, 0, RECTANGLE, 12, 16, 1, -15, 0)	
	scr_add_hurtbox(spr_mac_crouch, 3, 0, RECTANGLE, 12, 16, 1, -19, 0)	

	//mac grab (discontinuous hitboxes)
	scr_add_hurtbox(spr_mac_grab, 0, 0, RECTANGLE, 12, 16, 2, -17, 0)
	scr_add_hurtbox(spr_mac_grab, 1, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_grab, 2, 0, RECTANGLE, 12, 16, -2, -20, 0)
	scr_add_hurtbox(spr_mac_grab, 3, 0, RECTANGLE, 12, 16, -7, -20, 0)
	scr_add_hurtbox(spr_mac_grab, 4, 0, RECTANGLE, 12, 16, -11, -19, 0)
	scr_add_hurtbox(spr_mac_grab, 5, 0, RECTANGLE, 12, 16, -9, -21, 0)
	scr_add_hurtbox(spr_mac_grab, 6, 0, RECTANGLE, 11, 16, -9, -24, 0)
	scr_add_hurtbox(spr_mac_grab, 7, 0, RECTANGLE, 11, 16, -9, -25, 0)
	scr_add_hurtbox(spr_mac_grab, 8, 0, RECTANGLE, 11, 16, -9, -24, 0)
	scr_add_hurtbox(spr_mac_grab, 9, 0, RECTANGLE, 12, 16, -9, -21, 0)
	scr_add_hurtbox(spr_mac_grab, 10, 0, RECTANGLE, 12, 16, -11, -19, 0)
	scr_add_hurtbox(spr_mac_grab, 11, 0, RECTANGLE, 12, 16, -7, -20, 0)
	scr_add_hurtbox(spr_mac_grab, 12, 0, RECTANGLE, 12, 16, -2, -20, 0)
	scr_add_hurtbox(spr_mac_grab, 13, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_move(spr_mac_grab, 7, 0, CIRCLE, 15, 15, 5, -39, 0, 10, HOLD)

	//mac grab hold (discontinuous hitbox)
	scr_add_hurtbox(spr_mac_grab_hold, 0, 0, RECTANGLE, 12, 16, -9, -24, 0)
	scr_add_hurtbox(spr_mac_grab_hold, 1, 0, RECTANGLE, 12, 16, -9, -24, 0)
	scr_add_move(spr_mac_grab_hold, 1, 0, RECTANGLE, 1, 1, 5, -39, 0, 0.1, 0, 0, 0, -1)

	//mac throw forward (discontinuous hitbox)
	scr_add_hurtbox(spr_mac_throw_forward, 0, 0, RECTANGLE, 12, 16, -9, -24, 0)
	scr_add_hurtbox(spr_mac_throw_forward, 1, 0, RECTANGLE, 12, 16, -9, -24, 0)
	scr_add_move(spr_mac_throw_forward, 0, 0, RECTANGLE, 1, 1, 5, -39, 0, 7, 45, 6, 4, 0)

	//mac throw up (no hitbox)
	for (i = 0; i < 17; i++) {
		scr_add_hurtbox(spr_mac_throw_up, i, 0, RECTANGLE, 12, 16, -9, -24, 0)
	}
	scr_add_move(spr_mac_throw_up, 16, 0, RECTANGLE, 2, 2, 0, 0, 0, 5, 90, 8, 3, 0)

	//mac throw down (discontinuous hitbox, no hurtbox)
	scr_add_move(spr_mac_throw_down, 5, 0, RECTANGLE, 1, 1, -5, 0, 0, 14, 135, 8, 3, 0)

	//mac throw back (discontinuous hitbox)
	for (i = 0; i < 14; i++) {
		scr_add_hurtbox(spr_mac_throw_back, i, 0, RECTANGLE, 12, 16, -9, -24, 0)
	}
	scr_add_move(spr_mac_throw_back, 5, 0, RECTANGLE, 1, 1, -9, -24, 0, 13, 215, 4, 6, 0)

	//mac tilt forward (discontinuous hitboxes)
	scr_add_hurtbox(spr_mac_tilt_forward, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	for (i = 1; i < 13; i ++) {
		scr_add_hurtbox(spr_mac_tilt_forward, i, 0, RECTANGLE, 12, 16, 2, -18, 0)
		scr_add_move(spr_mac_tilt_forward, i, 0, RECTANGLE, 15, 30, 2, -18, 0, 5, 300, 2, 4) 
	}

	//mac tilt down (discontinuous hitboxes)
	for (i = 0; i < 24; i++) { //do a loop for all the similair frames
		if ((i >= 6) and (i < 18)) {
			scr_add_hurtbox(spr_mac_tilt_down, i, 0, RECTANGLE, 16, 12, 0, -5, 0)
			scr_add_move(spr_mac_tilt_down, i, 0, RECTANGLE, 38, 13, 0, -6, 0, 8, 30, 1, 3)
		} else {
			scr_add_hurtbox(spr_mac_tilt_down, i, 0, RECTANGLE, 12, 16, 1, -19, 0)
		}
	}
	scr_add_hurtbox(spr_mac_tilt_down, 5, 0, RECTANGLE, 12, 16, -9, -17, 45) //overrride hurtbox 
	scr_add_hurtbox(spr_mac_tilt_down, 18, 0, RECTANGLE, 12, 16, -9, -17, 45) //override hurtbox

	//mac tilt up (discontinuous hitboxes)
	for (i = 0; i < 24; i++) { //do a loop for all the similar frames
		scr_add_hurtbox(spr_mac_tilt_up, i, 0, RECTANGLE, 12, 16, 1, -19, 0)
	}
	scr_add_move(spr_mac_tilt_up, 4, 0, CIRCLE, 9, 9, 0, -36, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 5, 0, CIRCLE, 9, 9, 0, -43, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 6, 0, CIRCLE, 9, 9, 0, -50, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 7, 0, CIRCLE, 9, 9, 0, -57, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 8, 0, CIRCLE, 9, 9, 0, -64, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 9, 0, CIRCLE, 9, 9, 0, -71, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 10, 0, CIRCLE, 9, 9, 0, -78, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 11, 0, CIRCLE, 9, 9, 0, -83, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 12, 0, CIRCLE, 9, 9, 0, -86, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 13, 0, CIRCLE, 9, 9, 0, -87, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 14, 0, CIRCLE, 9, 9, 0, -87, 0, 6, 90, 3, 4)
	scr_add_move(spr_mac_tilt_up, 15, 0, CIRCLE, 9, 9, 0, -86, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 16, 0, CIRCLE, 9, 9, 0, -84, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 17, 0, CIRCLE, 9, 9, 0, -80, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 18, 0, CIRCLE, 9, 9, 0, -74, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 19, 0, CIRCLE, 9, 9, 0, -67, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 20, 0, CIRCLE, 9, 9, 0, -59, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 21, 0, CIRCLE, 9, 9, 0, -50, 0, 6, 270, 3, 4)
	scr_add_move(spr_mac_tilt_up, 22, 0, CIRCLE, 9, 9, 0, -40, 0, 6, 270, 3, 4)

	//mac jabs (discontinuous hitboxes)
	for (i = 0; i < 4; i++) {
		scr_add_hurtbox(spr_mac_jab_1, i, 0, RECTANGLE, 12, 16, 1, -19, 0)
		scr_add_hurtbox(spr_mac_jab_2, i, 0, RECTANGLE, 12, 16, 1, -19, 0)
		scr_add_hurtbox(spr_mac_jab_3, i, 0, RECTANGLE, 12, 16, 1, -19, 0)
	}
	scr_add_move(spr_mac_jab_1, 2, 0, CIRCLE, 8, 6, 13, -21, 0, 3, 0, 1, 5)
	scr_add_move(spr_mac_jab_2, 2, 0, CIRCLE, 8, 6, 13, -21, 0, 3, 0, 1, 5)
	scr_add_move(spr_mac_jab_3, 2, 0, CIRCLE, 8, 6, 13, -21, 0, 3, 0, 1, 5)

	//mac dash attack (discontinous hitboxes)
	scr_add_hurtbox(spr_mac_dash_attack, 0, 0, RECTANGLE, 12, 16, 2, -18, 0)
	scr_add_hurtbox(spr_mac_dash_attack, 1, 0, RECTANGLE, 12, 16, 2, -18, 0)
	scr_add_hurtbox(spr_mac_dash_attack, 2, 0, RECTANGLE, 12, 16, 2, -18, 0)
	scr_add_hurtbox(spr_mac_dash_attack, 3, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_move(spr_mac_dash_attack, 0, 0, RECTANGLE, 12, 16, 2, -18, 0, 8, 0, 2, 3)
	scr_add_move(spr_mac_dash_attack, 1, 0, RECTANGLE, 12, 16, 2, -18, 0, 8, 0, 2, 3)
	scr_add_move(spr_mac_dash_attack, 2, 0, RECTANGLE, 12, 16, 2, -18, 0, 8, 0, 2, 3)

	//mac aerials hurtboxes (all constant and the same)
	for (i = 0; i < 32; i++) {
		scr_add_hurtbox(spr_mac_aerial_up, i, 0, RECTANGLE, 11, 16, 0, -20, 0)
		scr_add_hurtbox(spr_mac_aerial_forward, i, 0, RECTANGLE, 11, 16, 0, -20, 0)
		scr_add_hurtbox(spr_mac_aerial_down, i, 0, RECTANGLE, 11, 16, 0, -20, 0)
		scr_add_hurtbox(spr_mac_aerial_back, i, 0, RECTANGLE, 11, 16, 0, -20, 0)
		scr_add_hurtbox(spr_mac_aerial_neutral, i, 0, RECTANGLE, 11, 16, 0, -20, 0)
	}

	//mac aerial forward (discontinuous hitboxes)
	scr_add_move(spr_mac_aerial_forward, 14, 0, CIRCLE, 2, 2, 24, -19, 0, 2, IN, 1, 1) 
	scr_add_move(spr_mac_aerial_forward, 15, 0, CIRCLE, 4, 4, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 16, 0, CIRCLE, 6, 6, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 17, 0, CIRCLE, 10, 10, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 18, 0, CIRCLE, 14, 14, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 19, 0, CIRCLE, 20, 20, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 20, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 21, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 22, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 23, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 24, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 25, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 26, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 27, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 28, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 29, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_forward, 30, 0, CIRCLE, 24, 24, 24, -19, 0, 2, IN, 1, 1)

	//mac aerial up (discontinuous hitboxes)
	scr_add_move(spr_mac_aerial_up, 14, 0, CIRCLE, 2, 2, -2, -53, 0, 2, IN, 1, 1) 
	scr_add_move(spr_mac_aerial_up, 15, 0, CIRCLE, 4, 4, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 16, 0, CIRCLE, 6, 6, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 17, 0, CIRCLE, 10, 10, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 18, 0, CIRCLE, 14, 14, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 19, 0, CIRCLE, 20, 20, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 20, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 21, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 22, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 23, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 24, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 25, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 26, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 27, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 28, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 29, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_up, 30, 0, CIRCLE, 24, 24, -2, -53, 0, 2, IN, 1, 1)

	//mac aerial down (discontinuous hitboxes)
	scr_add_move(spr_mac_aerial_down, 14, 0, CIRCLE, 2, 2, 0, 10, 0, 2, IN, 1, 1) 
	scr_add_move(spr_mac_aerial_down, 15, 0, CIRCLE, 4, 4, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 16, 0, CIRCLE, 6, 6, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 17, 0, CIRCLE, 10, 10, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 18, 0, CIRCLE, 14, 14, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 19, 0, CIRCLE, 20, 20, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 20, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 21, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 22, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 23, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 24, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 25, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 26, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 27, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 28, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 29, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_down, 30, 0, CIRCLE, 24, 24, 0, 10, 0, 2, IN, 1, 1)

	//mac aerial back (discontinuous hitboxes)
	scr_add_move(spr_mac_aerial_back, 14, 0, CIRCLE, 2, 2, -23, -19, 0, 2, IN, 1, 1) 
	scr_add_move(spr_mac_aerial_back, 15, 0, CIRCLE, 4, 4, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 16, 0, CIRCLE, 6, 6, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 17, 0, CIRCLE, 10, 10, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 18, 0, CIRCLE, 14, 14, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 19, 0, CIRCLE, 20, 20, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 20, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 21, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 22, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 23, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 24, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 25, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 26, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 27, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 28, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 29, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)
	scr_add_move(spr_mac_aerial_back, 30, 0, CIRCLE, 24, 24, -23, -19, 0, 2, IN, 1, 1)

	//mac aerial neutral (discontinuous hitboxes)
	scr_add_move(spr_mac_aerial_neutral, 5, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 6, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 7, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 8, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 9, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 10, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 11, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 12, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 13, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 14, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 15, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 16, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 17, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 18, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 19, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 20, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 21, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 22, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 23, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 24, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_aerial_neutral, 25, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)

	//mac smash forward (discontinuous hitbox)
	scr_add_hurtbox(spr_mac_smash_forward, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 1, 0, RECTANGLE, 12, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 2, 0, RECTANGLE, 12, 16, -1, -21, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 3, 0, RECTANGLE, 12, 16, -2, -20, 0)
	for (i = 4; i < 16; i++) {
		scr_add_hurtbox(spr_mac_smash_forward, i, 0, RECTANGLE, 12, 16, -3, -19, 0)
	}
	scr_add_hurtbox(spr_mac_smash_forward, 16, 0, RECTANGLE, 12, 16, -2, -20, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 17, 0, RECTANGLE, 12, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 18, 0, RECTANGLE, 12, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 19, 0, RECTANGLE, 12, 16, 0, -20, 0)
	scr_add_hurtbox(spr_mac_smash_forward, 20, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_move(spr_mac_smash_forward, 17, 0, CIRCLE, 28, 16, 24, -21, 0, 14, 30, 1, 11)
	scr_add_move(spr_mac_smash_forward, 18, 0, RECTANGLE, 86, 24, 54, -22, 0, 14, 30, 1, 11)
	scr_add_move(spr_mac_smash_forward, 19, 0, CIRCLE, 18, 22, 88, -21, 0, 14, 30, 1, 11)


	//mac smash down (discontinuous hitbox, discontinuous hurtbox)
	scr_add_hurtbox(spr_mac_smash_down, 0, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_smash_down, 1, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_smash_down, 2, 0, RECTANGLE, 12, 16, 1, -20, 0)
	scr_add_hurtbox(spr_mac_smash_down, 3, 0, RECTANGLE, 12, 16, 1, -21, 0)
	scr_add_hurtbox(spr_mac_smash_down, 4, 0, RECTANGLE, 12, 16, 1, -15, 0)
	scr_add_hurtbox(spr_mac_smash_down, 5, 0, RECTANGLE, 12, 16, 1, -10, 0)
	scr_add_hurtbox(spr_mac_smash_down, 6, 0, RECTANGLE, 12, 14, 1, -6, 0)
	scr_add_hurtbox(spr_mac_smash_down, 7, 0, RECTANGLE, 12, 7, 1, -4, 0)
	scr_add_hurtbox(spr_mac_smash_down, 8, 0, RECTANGLE, 8, 4, 1, -2, 0)
	scr_add_hurtbox(spr_mac_smash_down, 9, 0, RECTANGLE, 2, 2, 1, -1, 0)
	scr_add_hurtbox(spr_mac_smash_down, 17, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_smash_down, 18, 0, RECTANGLE, 12, 16, 1, -19, 0)
	scr_add_hurtbox(spr_mac_smash_down, 19, 0, RECTANGLE, 12, 16, 1, -19, 0)
	for (var i = 0; i < 14; i++) {
		scr_add_move(spr_mac_smash_down, i, 0, CIRCLE, 30, 30, 0, 0, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_mac_smash_down, 14, 0, CIRCLE, 39, 32, 0, 0, 0, 20, 90, 5, 7)
	scr_add_move(spr_mac_smash_down, 15, 0, CIRCLE, 39, 60, 0, 0, 0, 20, 90, 5, 7)
	scr_add_move(spr_mac_smash_down, 16, 0, CIRCLE, 39, 100, 0, 0, 0, 20, 90, 5, 7)

	//mac smash up (discontinuos hitboxes)
	for (i = 0; i < 11; i++) {
		scr_add_hurtbox(spr_mac_smash_up, i, 0, RECTANGLE, 12, 16, 1, -19, 0)	
	}
	for (var i = 0; i < 3; i++) {
		scr_add_move(spr_mac_smash_up, i, 0, CIRCLE, 30, 30, 28, 0, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_mac_smash_up, 3, 0, CIRCLE, 26, 30, 28, 0, 0, 25, 90, 14, 5)
	scr_add_move(spr_mac_smash_up, 4, 0, CIRCLE, 26, 30, 28, 0, 0, 25, 90, 14, 5)
	scr_add_move(spr_mac_smash_up, 5, 0, CIRCLE, 26, 100, 28, 0, 0, 25, 90, 14, 5)
	scr_add_move(spr_mac_smash_up, 6, 0, CIRCLE, 14, 96, 28, 0, 0, 25, 90, 14, 5)

	//mac special forward (no comment)
	for (i = 0; i < 13; i ++) {
		scr_add_hurtbox(spr_mac_special_forward, i, 0, RECTANGLE, 12, 16, 2, -18, 0)
		scr_add_move(spr_mac_special_forward, i, 0, RECTANGLE, 30, 20, 2, -18, 0, 2, 180, 20, 1)
	}

	//mac special down (discontinuous hitboxes)
	for (i = 0; i < 40; i++) {
		scr_add_hurtbox(spr_mac_special_down, i, 0, RECTANGLE, 12, 16, 1, -19, 0)
	}
	scr_add_move(spr_mac_special_down, 29, 0, RECTANGLE, 28, 200, 0, -100, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 30, 0, RECTANGLE, 28, 200, 0, -100, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 31, 0, RECTANGLE, 28, 200, 0, -100, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 32, 0, RECTANGLE, 28, 200, 0, -100, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 33, 0, RECTANGLE, 28, 200, 0, -100, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 34, 0, RECTANGLE, 28, 200, 0, -100, 0, 17, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 35, 0, RECTANGLE, 28, 140, 0, -70, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 36, 0, RECTANGLE, 28, 100, 0, -50, 0, 0, 270, 5, 2)
	scr_add_move(spr_mac_special_down, 37, 0, RECTANGLE, 28, 70, 0, -35, 0, 0, 270, 5, 2)

	//mac special up (discontinuous hitboxes)
	for (i = 0; i < 16; i++) {
		scr_add_hurtbox(spr_mac_special_up, i, 0, RECTANGLE, 12, 16, 1, -21, 0)	
		scr_add_move(spr_mac_special_up, i, 0, CIRCLE, 24, 32, 1, -21, DIR, 2, DIR, -1, 0, 6)
	}
	scr_add_move(spr_mac_special_up, 15, 0, CIRCLE, 30, 40, 1, -21, DIR, 6, DIR, 5, 9, 10) //overwrite
	scr_add_hurtbox(spr_mac_special_up, 16, 0, RECTANGLE, 12, 16, 1, -21, 0)	
	scr_add_hurtbox(spr_mac_special_up, 17, 0, RECTANGLE, 12, 16, 1, -21, 0)	
	scr_add_hurtbox(spr_mac_special_up, 18, 0, RECTANGLE, 12, 16, 1, -21, 0)	
	scr_add_hurtbox(spr_mac_special_up, 19, 0, RECTANGLE, 12, 16, 1, -21, 0)	

	//mac special neutral
	for (i = 0; i < 19; i++) {
		scr_add_hurtbox(spr_mac_special_neutral, i, 0, RECTANGLE, 11, 16, 0, -20, 0)
	}
	scr_add_move(spr_mac_special_neutral, 5, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 6, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 7, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 8, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 9, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 10, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 11, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
	scr_add_move(spr_mac_special_neutral, 12, 0, CIRCLE, 35, 53, -1, -17, 0, 1, IN, 1, 1)
#endregion MACHINATION

window_set_caption("Adding Hitboxes Into Memory GEO")

#region GEOS 302 lines
	//smash down, tilt down, ledge moves, hurt trio, crouch trio, grabbed have special case hurtboxes
	//general hurtbox, this is overwritten when necessary
	for (i = spr_geo_idle; i <= spr_geo_special_neutral; i++) { //for the range of geo sprites
		if (i = spr_geo_ledge) { i = spr_geo_taunt } //avoid this range of sprites [min, max)
		for (o = 0; o < sprite_get_number(i); o++) { //for every frame
			scr_add_hurtbox(i, o, 0, CIRCLE, 17, 11, 1, -17, 0) //add the top hurtbox
			if ((o mod 5 = 2) or (o mod 5 = 3)) { //if 3rd or 4th frame of loop
				scr_add_hurtbox(i, o, 1, CIRCLE, 9, 12, 2, -8, 0) //add lower hurtbox
			} else { //1st, 2nd, 5th frame of loop
				scr_add_hurtbox(i, o, 1, CIRCLE, 9, 12, 1, -8, 0) //add lower hurtbox shifted left
			}
		}
	}

	//special case hurtboxes and all hitboxes

	//geo ledge (no hitboxes)
	scr_add_hurtbox(spr_geo_ledge, 0, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 1, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 2, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 3, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 4, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 0, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 1, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 2, 1, CIRCLE, 9, 12, -30, 40, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 3, 1, CIRCLE, 9, 12, -30, 40, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 4, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left

	//geo ledge hold (no hitboxes)
	scr_add_hurtbox(spr_geo_ledge, 0, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 1, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 2, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 3, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 4, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 5, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 6, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 7, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 8, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 9, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 0, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 1, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 2, 1, CIRCLE, 9, 12, -30, 40, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 3, 1, CIRCLE, 9, 12, -30, 40, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 4, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 5, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 6, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 7, 1, CIRCLE, 9, 12, -30, 40, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 8, 1, CIRCLE, 9, 12, -30, 40, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 9, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left

	//geo ledge jump (no hitboxes)
	scr_add_hurtbox(spr_geo_ledge, 0, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 1, 0, CIRCLE, 17, 11, -31, 27, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 2, 0, CIRCLE, 17, 11, -28, 14, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 3, 0, CIRCLE, 17, 11, -26, 8, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 4, 0, CIRCLE, 17, 11, -21, -2, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge, 0, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 1, 1, CIRCLE, 9, 12, -31, 36, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge, 2, 1, CIRCLE, 9, 12, -27, 17, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 3, 1, CIRCLE, 9, 12, -25, 11, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge, 4, 1, CIRCLE, 9, 12, -20, 1, 0) //add lower hurtbox shifted left

	//geo ledge grab (discontinuous hitboxes)
	scr_add_hurtbox(spr_geo_ledge_grab, 0, 0, CIRCLE, 17, 11, -31, 31, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 1, 0, CIRCLE, 17, 11, -31, 27, 0) //add the top hurtbox 
	scr_add_hurtbox(spr_geo_ledge_grab, 2, 0, CIRCLE, 17, 11, -28, 14, 0) //add the top hurtbox 
	scr_add_hurtbox(spr_geo_ledge_grab, 3, 0, CIRCLE, 17, 11, -26, 8, 0) //add the top hurtbox 
	scr_add_hurtbox(spr_geo_ledge_grab, 4, 0, CIRCLE, 17, 11, -21, -2, 0) //add the top hurtbox 
	scr_add_hurtbox(spr_geo_ledge_grab, 5, 0, CIRCLE, 17, 11, -17, -7, 0) //add the top hurtbox 
	scr_add_hurtbox(spr_geo_ledge_grab, 6, 0, CIRCLE, 17, 11, -10, -11, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 7, 0, CIRCLE, 17, 11, 0, -18, 0) //add the top hurtbox 
	scr_add_hurtbox(spr_geo_ledge_grab, 8, 0, CIRCLE, 17, 11, 11, -18, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 9, 0, CIRCLE, 17, 11, 24, -18, 0) //add the top hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 0, 1, CIRCLE, 9, 12, -31, 40, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge_grab, 1, 1, CIRCLE, 9, 12, -31, 36, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge_grab, 2, 1, CIRCLE, 9, 12, -27, 23, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 3, 1, CIRCLE, 9, 12, -25, 17, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 4, 1, CIRCLE, 9, 12, -21, 7, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge_grab, 5, 1, CIRCLE, 9, 12, -17, 2, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge_grab, 6, 1, CIRCLE, 9, 12, -10, -2, 0) //add lower hurtbox shifted left
	scr_add_hurtbox(spr_geo_ledge_grab, 7, 1, CIRCLE, 9, 12, 1, -9, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 8, 1, CIRCLE, 9, 12, 12, -9, 0) //add lower hurtbox
	scr_add_hurtbox(spr_geo_ledge_grab, 9, 1, CIRCLE, 9, 12, 24, -9, 0) //add lower hurtbox shifted left
	scr_add_move(spr_geo_ledge_grab, 4, 0, CIRCLE, 26, 39, -40, -17, 0, 8, HOLD)
	scr_add_move(spr_geo_ledge_grab, 5, 0, CIRCLE, 55, 28, -14, -30, 0, 8, HOLD)
	scr_add_move(spr_geo_ledge_grab, 6, 0, CIRCLE, 20, 20, 16, -33, 0, 8, HOLD)
	scr_add_move(spr_geo_ledge_grab, 7, 0, CIRCLE, 25, 17, 26, -27, 0, 8, HOLD)
	scr_add_move(spr_geo_ledge_grab, 8, 0, CIRCLE, 21, 21, 34, -19, 0, 8, HOLD)

	//geo ledge attack (discontinuous hitboxes)
	scr_add_hurtbox(spr_geo_ledge_attack, 0, 0, CIRCLE, 17, 11, -31, 31, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 1, 0, CIRCLE, 17, 11, -31, 27, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 2, 0, CIRCLE, 17, 11, -28, 14, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 3, 0, CIRCLE, 17, 11, -26, 8, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 4, 0, CIRCLE, 17, 11, -21, 1, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 5, 0, CIRCLE, 17, 11, -16, -4, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 6, 0, CIRCLE, 17, 11, -9, -11, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 7, 0, CIRCLE, 17, 11, -2, -14, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 8, 0, CIRCLE, 17, 11, 2, -15, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 0, 1, CIRCLE, 9, 12, -30, 40, 0) //lower hurtboxes
	scr_add_hurtbox(spr_geo_ledge_attack, 1, 1, CIRCLE, 9, 12, -30, 36, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 2, 1, CIRCLE, 9, 12, -27, 23, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 3, 1, CIRCLE, 9, 12, -25, 17, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 4, 1, CIRCLE, 9, 12, -20, 7, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 5, 1, CIRCLE, 9, 12, -15, 2, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 6, 1, CIRCLE, 9, 12, -8, -2, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 7, 1, CIRCLE, 9, 12, -1, -8, 0)
	scr_add_hurtbox(spr_geo_ledge_attack, 8, 1, CIRCLE, 9, 12, 3, -9, 0)
	scr_add_move(spr_geo_ledge_attack, 2, 0, CIRCLE, 20, 26, -26, -3, -20, 13, 30, 3, 4)
	scr_add_move(spr_geo_ledge_attack, 3, 0, CIRCLE, 20, 28, -18, -11, -45, 13, 30, 3, 4)
	scr_add_move(spr_geo_ledge_attack, 4, 0, CIRCLE, 64, 30, 0, -15, 0, 13, 30, 3, 4)
	scr_add_move(spr_geo_ledge_attack, 5, 0, CIRCLE, 60, 28, 0, -15, 0, 13, 30, 3, 4)
	scr_add_move(spr_geo_ledge_attack, 6, 0, CIRCLE, 51, 29, 5, -23, 0, 13, 30, 3, 4)
	scr_add_move(spr_geo_ledge_attack, 7, 0, CIRCLE, 33, 18, 5, -30, 0, 13, 30, 3, 4)

	//geo hurt up (no hitbox)
	scr_add_hurtbox(spr_geo_hurt_up, 0, 0, CIRCLE, 17, 11, 1, -17, 0)
	scr_add_hurtbox(spr_geo_hurt_up, 0, 1, CIRCLE, 9, 12, 2, -8, 0)

	//geo hurt side (no hitbox)
	scr_add_hurtbox(spr_geo_hurt_side, 0, 0, CIRCLE, 17, 11, -3, -17, 0)
	scr_add_hurtbox(spr_geo_hurt_side, 0, 1, CIRCLE, 9, 12, -4, -8, 0)

	//geo hurt down (no hitbox)
	scr_add_hurtbox(spr_geo_hurt_down, 0, 0, CIRCLE, 15, 17, 0, -7, 0)

	//geo grabbed (no hitbox)
	scr_add_hurtbox(spr_geo_grabbed, 0, 0, CIRCLE, 17, 11, -6, -1, 0)
	scr_add_hurtbox(spr_geo_grabbed, 0, 1, CIRCLE, 9, 12, -4, -6, 0)
	scr_add_hurtbox(spr_geo_grabbed, 0, 2, RECTANGLE, 2, 2, 0, 0, 0)

	//geo crouch (no hitbox)
	scr_add_hurtbox(spr_geo_crouch, 0, 0, CIRCLE, 17, 11, 1, -17, 0) 
	scr_add_hurtbox(spr_geo_crouch, 0, 1, CIRCLE, 9, 12, 1, -8, 0)
	scr_add_hurtbox(spr_geo_crouch, 1, 0, CIRCLE, 16, 14, 0, -11, 0) 
	scr_add_hurtbox(spr_geo_crouch, 2, 0, CIRCLE, 17, 15, 2, -11, 0) 
	scr_add_hurtbox(spr_geo_crouch, 3, 0, CIRCLE, 17, 12, 2, -8, 0) 
	scr_add_hurtbox(spr_geo_crouch, 4, 0, CIRCLE, 17, 11, 2, -7, 0) 

	//geo crouch hold (no hitbox)
	scr_add_hurtbox(spr_geo_crouch_hold, 0, 0, CIRCLE, 17, 11, 2, -7, 0) 
	scr_add_hurtbox(spr_geo_crouch_hold, 1, 0, CIRCLE, 17, 11, 2, -7, 0) 
	scr_add_hurtbox(spr_geo_crouch_hold, 2, 0, CIRCLE, 17, 11, 2, -7, 0) 

	//geo crouch end (no hitbox)
	scr_add_hurtbox(spr_geo_crouch_end, 0, 0, CIRCLE, 17, 11, 2, -7, 0) 
	scr_add_hurtbox(spr_geo_crouch_end, 1, 0, CIRCLE, 17, 12, 2, -8, 0) 
	scr_add_hurtbox(spr_geo_crouch_end, 2, 0, CIRCLE, 17, 15, 2, -11, 0) 
	scr_add_hurtbox(spr_geo_crouch_end, 3, 0, CIRCLE, 16, 14, 0, -11, 0) 
	scr_add_hurtbox(spr_geo_crouch_end, 4, 0, CIRCLE, 17, 11, 1, -17, 0) 
	scr_add_hurtbox(spr_geo_crouch_end, 4, 1, CIRCLE, 9, 12, 1, -8, 0)

	//geo grab (discontinuous hitbox)
	scr_add_move(spr_geo_grab, 4, 0, CIRCLE, 26, 39, -16, -44, 0, 8, HOLD)
	scr_add_move(spr_geo_grab, 5, 0, CIRCLE, 55, 28, 0, -46, 0, 8, HOLD)
	scr_add_move(spr_geo_grab, 6, 0, CIRCLE, 20, 20, 35, -39, 0, 8, HOLD)
	scr_add_move(spr_geo_grab, 7, 0, CIRCLE, 25, 17, 34, -23, 0, 8, HOLD)
	scr_add_move(spr_geo_grab, 8, 0, CIRCLE, 21, 21, 29, -12, 0, 8, HOLD)

	//geo grab hold (no hitbox)

	//geo grab jab (handled elsewhere)

	//geo throw forward (point hitbox)
	scr_add_move(spr_geo_throw_forward, 5, 0, RECTANGLE, 1, 1, 32, -32, 0, 11, 20, 4, 2, 0)

	//geo throw up (point hitbox)
	scr_add_move(spr_geo_throw_up, 5, 0, RECTANGLE, 1, 1, 32, -32, 0, 4, 90, 7, 5, 0)

	//geo throw down (point hitbox)
	scr_add_move(spr_geo_throw_down, 0, 0, RECTANGLE, 1, 1, 32, -32, 0, 7, 270, 2, 10, 0)

	//geo throw back (point hitbox)
	scr_add_move(spr_geo_throw_back, 0, 0, RECTANGLE, 1, 1, 32, -32, 0, 7, 180, 10, 5, 0)

	//geo tilt forward (discontinuous hitbox)
	scr_add_move(spr_geo_tilt_forward, 1, 0, CIRCLE, 25, 25, -10, -16, 0, 3, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_forward, 1, 1, CIRCLE, 25, 25, 10, -16, 0, 3, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_forward, 2, 0, CIRCLE, 25, 25, -13, -16, 0, 4, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_forward, 2, 1, CIRCLE, 25, 25, 13, -16, 0, 4, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_forward, 3, 0, CIRCLE, 25, 25, 16, -16, 0, 6, OUT, 3, 3)
	scr_add_move(spr_geo_tilt_forward, 3, 1, CIRCLE, 25, 25, -16, -16, 0, 6, OUT, 3, 3)
	scr_add_move(spr_geo_tilt_forward, 4, 0, CIRCLE, 25, 25, 16, -16, 0, 5, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_forward, 4, 1, CIRCLE, 25, 25, -16, -16, 0, 5, OUT, 2, 3)

	//geo tilt down (discontinuous hitbox, special hitboxes)
	scr_add_hurtbox(spr_geo_tilt_down, 0, 0, CIRCLE, 17, 11, 1, -17, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 0, 1, CIRCLE, 9, 12, 1, -8, 0)
	scr_add_hurtbox(spr_geo_tilt_down, 1, 0, CIRCLE, 16, 14, 0, -11, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 2, 0, CIRCLE, 17, 15, 2, -11, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 3, 0, CIRCLE, 17, 12, 2, -8, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 4, 0, CIRCLE, 17, 11, 2, -7, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 5, 0, CIRCLE, 17, 11, 2, -7, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 6, 0, CIRCLE, 17, 12, 2, -8, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 7, 0, CIRCLE, 17, 15, 2, -11, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 8, 0, CIRCLE, 16, 14, 0, -11, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 9, 0, CIRCLE, 17, 11, 1, -17, 0) 
	scr_add_hurtbox(spr_geo_tilt_down, 9, 1, CIRCLE, 9, 12, 1, -8, 0)
	scr_add_move(spr_geo_tilt_down, 1, 0, CIRCLE, 25, 25, -10, -16, 0, 3, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_down, 1, 1, CIRCLE, 25, 25, 10, -16, 0, 3, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_down, 2, 0, CIRCLE, 25, 25, -13, -14, 0, 4, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_down, 2, 1, CIRCLE, 25, 25, 13, -14, 0, 4, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_down, 3, 0, CIRCLE, 25, 25, 16, -12, 0, 6, OUT, 3, 3)
	scr_add_move(spr_geo_tilt_down, 3, 1, CIRCLE, 25, 25, -16, -12, 0, 6, OUT, 3, 3)
	scr_add_move(spr_geo_tilt_down, 4, 0, CIRCLE, 25, 25, 16, -10, 0, 5, OUT, 2, 3)
	scr_add_move(spr_geo_tilt_down, 4, 1, CIRCLE, 25, 25, -16, -10, 0, 5, OUT, 2, 3)

	//geo tilt up (discontinuous hitboxes)
	scr_add_move(spr_geo_tilt_up, 2, 0, CIRCLE, 21, 21, 29, -24, 0, 8, OUT, 3, 5)
	scr_add_move(spr_geo_tilt_up, 3, 0, CIRCLE, 25, 17, 34, -37, 0, 8, OUT, 3, 5)
	scr_add_move(spr_geo_tilt_up, 4, 0, CIRCLE, 20, 20, 30, -39, 0, 8, OUT, 3, 5)
	scr_add_move(spr_geo_tilt_up, 5, 0, CIRCLE, 55, 28, 0, -46, 0, 8, OUT, 3, 5)
	scr_add_move(spr_geo_tilt_up, 6, 0, CIRCLE, 26, 39, -16, -31, 0, 8, OUT, 3, 5)

	//geo flurry (no comment)
	for (i = 0; i < 10; i++) {
		scr_add_move(spr_geo_flurry, i, 0, CIRCLE, 42, 44, 0, -22, 0, 0.25, IN, 1, 1, 0.5)
	}

	//geo dash attack (discontinuous hitbox)
	scr_add_move(spr_geo_dash_attack, 4, 0, CIRCLE, 13, 17, 25, -11, 0, 7, 45, 2, 10)
	scr_add_move(spr_geo_dash_attack, 5, 0, CIRCLE, 13, 17, 25, -11, 0, 7, 45, 2, 10)
	scr_add_move(spr_geo_dash_attack, 6, 0, CIRCLE, 13, 17, 25, -11, 0, 7, 45, 2, 10)

	//geo aerial forward (discontinuous hitbox)
	scr_add_move(spr_geo_aerial_forward, 4, 0, CIRCLE, 13, 17, 25, -11, 0, 9, 45, 6, 1)
	scr_add_move(spr_geo_aerial_forward, 5, 0, CIRCLE, 13, 17, 25, -11, 0, 9, 45, 6, 1)
	scr_add_move(spr_geo_aerial_forward, 6, 0, CIRCLE, 13, 17, 25, -11, 0, 9, 45, 6, 1)

	//geo aerial up (discontinuous hitbox)
	scr_add_move(spr_geo_aerial_up, 1, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)
	scr_add_move(spr_geo_aerial_up, 2, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)
	scr_add_move(spr_geo_aerial_up, 3, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)
	scr_add_move(spr_geo_aerial_up, 4, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)
	scr_add_move(spr_geo_aerial_up, 5, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)
	scr_add_move(spr_geo_aerial_up, 6, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)
	scr_add_move(spr_geo_aerial_up, 7, 0, RECTANGLE, 50, 40, 0, -53, 0, 1, 90, 2, 8, 0)

	//geo aerial down (discontinuous hitbox)
	scr_add_move(spr_geo_aerial_down, 3, 0, CIRCLE, 20, 20, 1, 15, 0, 7, 270, 4, 1)
	scr_add_move(spr_geo_aerial_down, 4, 0, CIRCLE, 30, 30, 1, 15, 0, 13, 270, 9, 5, 7)
	scr_add_move(spr_geo_aerial_down, 5, 0, CIRCLE, 30, 30, 1, 15, 0, 12, 270, 9, 5, 7)
	scr_add_move(spr_geo_aerial_down, 6, 0, CIRCLE, 20, 20, 1, 15, 0, 4, 270, 3, 2)

	//geo aerial back (discontinuous hitbox)
	scr_add_move(spr_geo_aerial_back, 7, 0, CIRCLE, 19, 20, -14, -12, 0, 11, 200, 3, 5)
	scr_add_move(spr_geo_aerial_back, 8, 0, CIRCLE, 19, 20, -14, -12, 0, 11, 200, 3, 5)

	//geo aerial neutral (discontinuous hitbox)
	for (i = 4; i < 15; i++) {
		scr_add_move(spr_geo_aerial_neutral, i, 0, CIRCLE, 45, 45, 0, -22, 0, 2, IN, 1, 2)
	}

	//geo smash forward (discontinuous hitbox)
	for (var i = 0; i < 2; i++) {
		scr_add_move(spr_geo_smash_forward, i, 0, CIRCLE, 30, 30, 20, -18, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_geo_smash_forward, 2, 0, RECTANGLE, 27, 15, 20, -18, 0, 29, 340, 9, 7)

	//geo smash down (discontinuous hitbox, special hurtboxes)
	scr_add_hurtbox(spr_geo_smash_down, 0, 0, CIRCLE, 17, 11, 1, -17, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 0, 1, CIRCLE, 9, 12, 1, -8, 0)
	scr_add_hurtbox(spr_geo_smash_down, 1, 0, CIRCLE, 16, 14, 0, -11, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 2, 0, CIRCLE, 17, 15, 2, -11, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 3, 0, CIRCLE, 17, 12, 2, -8, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 4, 0, CIRCLE, 17, 11, 2, -7, 0) 
	for (i = 5; i < 15; i++) {
		scr_add_hurtbox(spr_geo_smash_down, i, 0, CIRCLE, 17, 11, 2, -7, 0) 
	}
	scr_add_hurtbox(spr_geo_smash_down, 15, 0, CIRCLE, 17, 11, 2, -7, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 16, 0, CIRCLE, 17, 12, 2, -8, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 17, 0, CIRCLE, 17, 15, 2, -11, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 18, 0, CIRCLE, 16, 14, 0, -11, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 19, 0, CIRCLE, 17, 11, 1, -17, 0) 
	scr_add_hurtbox(spr_geo_smash_down, 19, 1, CIRCLE, 9, 12, 1, -8, 0)
	for (var i = 0; i < 4; i++) {
		scr_add_move(spr_geo_smash_down, i, 0, CIRCLE, 30, 30, -23, -10, 0, 0, IN, 0.01, 0, 0)
		scr_add_move(spr_geo_smash_down, i, 1, CIRCLE, 30, 30, 23, -10, 0, 0, IN, 0.01, 0, 0)
	}
	for (i = 0; i < 2; i++) {
		scr_add_move(spr_geo_smash_down, 4 + i*6, 0, CIRCLE, 28, 21, -23, -10, 0, 23, IN, 5, 8)
		scr_add_move(spr_geo_smash_down, 4 + i*6, 1, CIRCLE, 28, 21, 23, -10, 0, 23, IN, 5, 8)
		scr_add_move(spr_geo_smash_down, 5 + i*6, 0, RECTANGLE, 55, 13, 1, -5, 0, 23, IN, 5, 8)
		scr_add_move(spr_geo_smash_down, 6 + i*6, 0, RECTANGLE, 41, 13, 1, -5, 0, 23, OUT, 5, 8)
		scr_add_move(spr_geo_smash_down, 7 + i*6, 0, RECTANGLE, 55, 13, 1, -5, 0, 23, OUT, 5, 8)
		scr_add_move(spr_geo_smash_down, 8 + i*6, 0, CIRCLE, 28, 21, 23, -10, 0, 23, OUT, 5, 8)
		scr_add_move(spr_geo_smash_down, 8 + i*6, 1, CIRCLE, 28, 21, -23, -10, 0, 23, OUT, 5, 8)
	}

	//geo smash up (discontinuous hitboxes)
	for (var i = 0; i < 3; i++) {
		scr_add_move(spr_geo_smash_up, i, 0, CIRCLE, 30, 30, 1, -37, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_geo_smash_up, 3, 0, RECTANGLE, 27, 29, 1, -37, 0, 10, 90, 4, 12)
	scr_add_move(spr_geo_smash_up, 4, 0, RECTANGLE, 33, 42, 1, -42, 0, 20, 90, 6, 6)
	scr_add_move(spr_geo_smash_up, 5, 0, RECTANGLE, 36, 65, 0, -54, 0, 30, 90, 8, 2)
	scr_add_move(spr_geo_smash_up, 6, 0, RECTANGLE, 38, 75, 0, -60, 0, 40, 90, 10, 1)

	//geo special forward (discontinuous hitbox)
	scr_add_move(spr_geo_special_forward, 1, 0, CIRCLE, 5, 6, 30, -18, 0, 0, 0, 6, 4, -1)
	scr_add_move(spr_geo_special_forward, 2, 0, CIRCLE, 14, 14, 38, -19, 0, 0, 0, 8, 4, -1)
	scr_add_move(spr_geo_special_forward, 3, 0, CIRCLE, 21, 23, 45, -23, 0, 0, 0, 10, 4, -1)
	scr_add_move(spr_geo_special_forward, 4, 0, CIRCLE, 25, 23, 52, -22, 0, 0, 0, 10, 4, -1)
	scr_add_move(spr_geo_special_forward, 5, 0, CIRCLE, 17, 17, 59, -24, 0, 0, 0, 10, 4, -1)
	scr_add_move(spr_geo_special_forward, 6, 0, CIRCLE, 10, 11, 63, -24, 0, 0, 0, 8, 4, -1)
	scr_add_move(spr_geo_special_forward, 7, 0, CIRCLE, 6, 5, 67, -25, 0, 0, 0, 6, 4, -1)

	//geo special down (sustain only has hitbox)
	for (i = 0; i < 5; i++) {
		scr_add_move(spr_geo_special_down_sustain, i, 0, CIRCLE, 42, 40, 0, -19, 0, 2, IN, 3, 2)	
	}

	//geo special up (discontinuous hitbox)
	scr_add_move(spr_geo_special_up, 6, 0, RECTANGLE, 42, 40, 0, -20, 0, 4, 270, 30, -5)

	//geo special neutral (no hitbox)
#endregion GEOS

window_set_caption("Adding Hitboxes Into Memory ETH")

#region ETH 186 lines
	//eth general hurtbox
	for (i = spr_eth_idle; i <= spr_eth_special_neutral; i++) { //for the range of geo sprites
		if (i = spr_eth_shield) { i = spr_eth_throw_forward } //avoid this range of sprites [min, max)
		for (o = 0; o < sprite_get_number(i); o++) { //for every frame
			scr_add_hurtbox(i, o, 0, RECTANGLE, 11, 21, 0, scr_triangle_wave(2, 8, 4.5, -31.5, o), 0) //add the top hurtbox
		}
	}

	//eth air dodge (no hitbox, no hurtbox)
	scr_add_hurtbox(spr_eth_air_dodge, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)

	//eth land (no hitbox)
	scr_add_hurtbox(spr_eth_land, 0, 0, RECTANGLE, 11, 21, 0, -30, 0)
	scr_add_hurtbox(spr_eth_land, 1, 0, RECTANGLE, 11, 21, 0, -29, 0)
	scr_add_hurtbox(spr_eth_land, 2, 0, RECTANGLE, 11, 21, 0, -28, 0)

	//eth shield (no hitbox)
	scr_add_hurtbox(spr_eth_shield, 0, 0, RECTANGLE, 11, 21, 0, -28, 0)
	scr_add_hurtbox(spr_eth_shield, 1, 0, RECTANGLE, 11, 21, 0, -26, 0)
	scr_add_hurtbox(spr_eth_shield, 2, 0, RECTANGLE, 11, 21, 0, -22, 0)
	scr_add_hurtbox(spr_eth_shield, 3, 0, RECTANGLE, 11, 21, 0, -17, 0)
	scr_add_hurtbox(spr_eth_shield, 4, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_shield, 5, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_shield, 6, 0, RECTANGLE, 11, 21, 0, -16, 0)

	//eth hold shield(no hitbox)
	scr_add_hurtbox(spr_eth_hold_shield, 0, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_hold_shield, 1, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_hold_shield, 2, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_hold_shield, 3, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_hold_shield, 4, 0, RECTANGLE, 11, 21, 0, -16, 0)

	//eth un shield (no hitbox)
	scr_add_hurtbox(spr_eth_un_shield, 0, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_un_shield, 1, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_un_shield, 2, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_un_shield, 3, 0, RECTANGLE, 11, 21, 0, -17, 0)
	scr_add_hurtbox(spr_eth_un_shield, 4, 0, RECTANGLE, 11, 21, 0, -22, 0)
	scr_add_hurtbox(spr_eth_un_shield, 5, 0, RECTANGLE, 11, 21, 0, -26, 0)
	scr_add_hurtbox(spr_eth_un_shield, 6, 0, RECTANGLE, 11, 21, 0, -28, 0)

	//eth roll (no hitbox, discontinuous hurtbox)
	scr_add_hurtbox(spr_eth_roll, 0, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_roll, 9, 0, RECTANGLE, 11, 21, 0, -28, 0)

	//eth dodge (no hitbox, discontinuous hurtbox)
	scr_add_hurtbox(spr_eth_roll, 0, 0, RECTANGLE, 11, 21, 0, -16, 0)
	scr_add_hurtbox(spr_eth_roll, 9, 0, RECTANGLE, 11, 21, 0, -16, 0)

	//eth ledge (no hitbox)
	for (i = 0; i < 7; i++) {
		scr_add_hurtbox(spr_eth_ledge, i, 0, RECTANGLE, 11, 21, -15, 21, 0)	
	}

	//eth ledge hold (no hitbox, no hurtbox)

	//eth ledge roll (no hitbox, discontinuous hurtbox)
	scr_add_hurtbox(spr_eth_ledge_roll, 0, 0, RECTANGLE, 11, 21, -15, 21, 0)
	scr_add_hurtbox(spr_eth_ledge_roll, 9, 0, RECTANGLE, 11, 21, 110, -28, 0)

	//eth ledge jump (no hitbox, no hurtbox)

	//eth ledge grab (no hurtbox, discontinuous hitbox)
	scr_add_move(spr_eth_ledge_grab, 4, 0, CIRCLE, 5, 5, 15, -23, 0, 3, HOLD)
	scr_add_move(spr_eth_ledge_grab, 5, 0, CIRCLE, 5, 5, 25, -23, 0, 3, HOLD)
	scr_add_move(spr_eth_ledge_grab, 6, 0, CIRCLE, 5, 5, 38, -23, 0, 3, HOLD)
	scr_add_move(spr_eth_ledge_grab, 7, 0, CIRCLE, 5, 5, 48, -23, 0, 3, HOLD)
	scr_add_move(spr_eth_ledge_grab, 8, 0, CIRCLE, 5, 5, 58, -23, 0, 3, HOLD)

	//eth ledge attack (no hurtbox, discontinuous hitbox)
	scr_add_move(spr_eth_ledge_attack, 7, 0, CIRCLE, 22, 4, 33, -24, 30, 7, 200, 4, 6)
	scr_add_move(spr_eth_ledge_attack, 8, 0, CIRCLE, 38, 15, 24, -21, 30, 7, 200, 4, 6)
	scr_add_move(spr_eth_ledge_attack, 9, 0, CIRCLE, 21, 12, 30, -23, 30, 7, 200, 4, 6)

	//eth hurt up (no hitbox)
	scr_add_hurtbox(spr_eth_hurt_up, 0, 0, RECTANGLE, 11, 21, 0, -26, 0)

	//eth hurt side (no hitbox)
	scr_add_hurtbox(spr_eth_hurt_side, 0, 0, RECTANGLE, 11, 21, 0, -26, 0)

	//eth hurt down (no hitbox)
	scr_add_hurtbox(spr_eth_hurt_down, 0, 0, RECTANGLE, 21, 11, -5, -9, 0)

	//eth grabbed (no hitbox)
	scr_add_hurtbox(spr_eth_grabbed, 0, 0, RECTANGLE, 11, 21, -3, 0, 0)
	scr_add_hurtbox(spr_eth_grabbed, 0, 1, RECTANGLE, 2, 2, 0, 0, 0)

	//eth taunt (no hitbox, no hurtbox)

	//eth platform, laser, grab, grab jab, grab hold, are not hitboxes, but objects so are omitted

	//eth throws
	scr_add_move(spr_eth_throw_forward, 5, 0, RECTANGLE, 1, 1, 0, 0, 0, 10, 0, 8, 5, 0)
	scr_add_move(spr_eth_throw_up, 4, 0, RECTANGLE, 1, 1, 0, 0, 0, 12, 90, 2, 7, 0)
	scr_add_move(spr_eth_throw_down, 8, 0, RECTANGLE, 1, 1, 0, 0, 0, 6, 270, 1, 9, 0)
	scr_add_move(spr_eth_throw_back, 39, 0, RECTANGLE, 1, 1, 0, 0, 0, 7, 180, 4, 10, 0)

	//eth aerial forward (single hitbox, hurtbox already handled)
	scr_add_move(spr_eth_aerial_forward, 9, 0, CIRCLE, 19, 19, 29, -32, 0, 8, 0, 3, 2)
	scr_add_move(spr_eth_aerial_forward, 9, 1, CIRCLE, 1, 1, 29, -32, 0, 8, 0, 3, 2, 7)

	//eth aerial down (single hitbox, hurtbox already handled)
	scr_add_move(spr_eth_aerial_down, 9, 0, CIRCLE, 19, 19, -2, -2, 0, 8, 270, 3, 2)
	scr_add_move(spr_eth_aerial_down, 9, 1, CIRCLE, 1, 1, -2, -2, 0, 8, 270, 3, 2, 9)

	//eth aerial up (single hitbox, hurtbox already handled)
	scr_add_move(spr_eth_aerial_up, 9, 0, CIRCLE, 19, 19, 1, -46, 0, 8, 90, 3, 2)
	scr_add_move(spr_eth_aerial_up, 9, 1, CIRCLE, 1, 1, 1, -46, 0, 8, 90, 3, 2, 7)

	//eth aerial back (single hitbox, hurtbox already handled)
	scr_add_move(spr_eth_aerial_back, 9, 0, CIRCLE, 19, 19, -15, -22, 0, 8, 180, 3, 2)
	scr_add_move(spr_eth_aerial_back, 9, 1, CIRCLE, 1, 1, -15, -22, 0, 8, 180, 3, 2, 7)

	//eth aerial neutral (single hitbox, hurtbox already handled)
	scr_add_move(spr_eth_aerial_neutral, 9, 0, CIRCLE, 19, 19, -26, -59, 0, 8, OUT, 3, 2, 3)
	scr_add_move(spr_eth_aerial_neutral, 9, 1, CIRCLE, 19, 19, 24, 6, 0, 8, OUT, 3, 2, 3)
	scr_add_move(spr_eth_aerial_neutral, 9, 2, CIRCLE, 19, 19, -27, 6, 0, 8, OUT, 3, 2, 3)
	scr_add_move(spr_eth_aerial_neutral, 9, 3, CIRCLE, 19, 19, 23, -59, 0, 8, OUT, 3, 2, 3)

	//eth smash forward (discontinuous hitbox)
	for (var i = 0; i < 3; i++) {
		scr_add_move(spr_eth_smash_forward, i, 0, CIRCLE, 30, 30, 23, -25, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_eth_smash_forward, 3, 0, CIRCLE, 22, 4, 23, -25, -30, 27, 340, 14, 6)
	scr_add_move(spr_eth_smash_forward, 4, 0, CIRCLE, 38, 15, 33, -21, -30, 27, 340, 14, 6)
	scr_add_move(spr_eth_smash_forward, 5, 0, CIRCLE, 21, 12, 28, -23, -30, 27, 340, 14, 6)

	//eth smash down (discontinuous hitbox, special hurtbox)
	scr_add_hurtbox(spr_eth_smash_down, 0, 0, RECTANGLE, 11, 21, 0, -28, 0)
	scr_add_hurtbox(spr_eth_smash_down, 1, 0, RECTANGLE, 11, 21, 4, -26, 0)
	scr_add_hurtbox(spr_eth_smash_down, 2, 0, RECTANGLE, 11, 21, 8, -22, 0)
	scr_add_hurtbox(spr_eth_smash_down, 3, 0, RECTANGLE, 11, 21, 12, -17, 0)
	scr_add_hurtbox(spr_eth_smash_down, 4, 0, RECTANGLE, 11, 21, 12, -16, 0)
	scr_add_hurtbox(spr_eth_smash_down, 5, 0, RECTANGLE, 11, 21, 12, -16, 0)
	scr_add_hurtbox(spr_eth_smash_down, 6, 0, RECTANGLE, 11, 21, 12, -16, 0)
	scr_add_hurtbox(spr_eth_smash_down, 7, 0, RECTANGLE, 11, 21, 12, -16, 0)
	scr_add_hurtbox(spr_eth_smash_down, 8, 0, RECTANGLE, 11, 21, 12, -16, 0)
	scr_add_hurtbox(spr_eth_smash_down, 9, 0, RECTANGLE, 11, 21, 12, -16, 0)
	scr_add_hurtbox(spr_eth_smash_down, 10, 0, RECTANGLE, 11, 21, 12, -17, 0)
	scr_add_hurtbox(spr_eth_smash_down, 11, 0, RECTANGLE, 11, 21, 8, -22, 0)
	scr_add_hurtbox(spr_eth_smash_down, 12, 0, RECTANGLE, 11, 21, 4, -26, 0)
	scr_add_hurtbox(spr_eth_smash_down, 13, 0, RECTANGLE, 11, 21, 0, -28, 0)
	for (var i = 0; i < 6; i++) {
		scr_add_move(spr_eth_smash_down, i, 0, CIRCLE, 30, 30, -12, -13, 0, 0, IN, 0.01, 0, 0)
		scr_add_move(spr_eth_smash_down, i, 0, CIRCLE, 30, 30, 34, -13, 0, 0, IN, 0.01, 0, 0)
	}
	scr_add_move(spr_eth_smash_down, 6, 0, CIRCLE, 22, 4, -12, -13, 30, 29, OUT, 5, 8)
	scr_add_move(spr_eth_smash_down, 6, 1, CIRCLE, 22, 4, 34, -13, -30, 29, OUT, 5, 8)
	scr_add_move(spr_eth_smash_down, 7, 0, CIRCLE, 38, 15, -22, -10, 30, 29, OUT, 5, 8)
	scr_add_move(spr_eth_smash_down, 7, 1, CIRCLE, 38, 15, 44, -10, -30, 29, OUT, 5, 8)
	scr_add_move(spr_eth_smash_down, 8, 0, CIRCLE, 21, 12, -17, -13, 30, 29, OUT, 5, 8)
	scr_add_move(spr_eth_smash_down, 8, 1, CIRCLE, 21, 12, 39, -13, -30, 29, OUT, 5, 8)

	//eth smash up (special hurtbox, discontinuous hitbox)
	scr_add_hurtbox(spr_eth_smash_up, 0, 0, RECTANGLE, 11, 21, 0, -28, 0)
	scr_add_hurtbox(spr_eth_smash_up, 1, 0, RECTANGLE, 11, 21, 0, -26, 0)
	scr_add_hurtbox(spr_eth_smash_up, 2, 0, RECTANGLE, 11, 21, 0, -22, 0)
	scr_add_hurtbox(spr_eth_smash_up, 3, 0, RECTANGLE, 11, 21, 0, -17, 0)
	for (var i = 0; i < 4; i++) {
		scr_add_move(spr_eth_smash_up, i, 0, CIRCLE, 30, 30, 0, 20, 0, 0, IN, 0.01, 0, 0)
	}
	for (i = 4; i < 15; i++) {
		scr_add_hurtbox(spr_eth_smash_up, i, 0, RECTANGLE, 11, 21, 0, 0 - i*5, 0)
		scr_add_move(spr_eth_smash_up, i, 0, RECTANGLE, 100, 3, 0, -i*5 + 20, 0, 10, 90, 2, 5)
	}
	scr_add_hurtbox(spr_eth_smash_up, 15, 0, RECTANGLE, 11, 21, 0, -80, 0)
	scr_add_hurtbox(spr_eth_smash_up, 16, 0, RECTANGLE, 11, 21, 0, -90, 0)
	scr_add_hurtbox(spr_eth_smash_up, 17, 0, RECTANGLE, 11, 21, 0, -96, 0)

	//eth special forward (removes some hurtboxes, discontinuous hitboxes)
	for (i = 1; i < 10; i++) {
		scr_add_hurtbox(spr_eth_special_forward, i, 0, NULL, NULL, NULL, NULL, NULL, NULL)	
	}
	scr_add_move(spr_eth_special_forward, 0, 0, RECTANGLE, 11, 21, 0, -27, 0, 10, OUT, 2, 5, 15)
	scr_add_move(spr_eth_special_forward, 10, 0, RECTANGLE, 11, 21, 0, -27, 0, 10, OUT, 2, 5, 15)

	//eth special down (hitboxes handled in other code, hurtboxes changed
	scr_add_hurtbox(spr_eth_special_down, 0, 0, RECTANGLE, 11, 21, 0, -28, 0)
	scr_add_hurtbox(spr_eth_special_down, 1, 0, RECTANGLE, 11, 21, 4, -26, 0)
	scr_add_hurtbox(spr_eth_special_down, 2, 0, RECTANGLE, 11, 21, 8, -22, 0)
	scr_add_hurtbox(spr_eth_special_down, 3, 0, RECTANGLE, 11, 21, 12, -17, 0)
	scr_add_hurtbox(spr_eth_special_down, 4, 0, RECTANGLE, 11, 21, 12, -17, 0)
	scr_add_hurtbox(spr_eth_special_down, 5, 0, RECTANGLE, 11, 21, 8, -22, 0)
	scr_add_hurtbox(spr_eth_special_down, 6, 0, RECTANGLE, 11, 21, 4, -26, 0)
	scr_add_hurtbox(spr_eth_special_down, 7, 0, RECTANGLE, 11, 21, 0, -28, 0)

	//eth special up (special hurtboxes, discontinuous hitboxes)
	for (i = 0; i < 17; i++) {
		scr_add_hurtbox(spr_eth_special_up, i, 0, RECTANGLE, 11, 21, 0, -28, 0)
		if ((i mod 11) > 5) {
			scr_add_move(spr_eth_special_up, i, 0, RECTANGLE, 11, 40, 0, -24, 0, 8, DIR, 3, 5)		
		}
	}

	//eth special neutral (hitbox object handled in other code, no new hurtbox)

#endregion


#endregion that took forever, probably create a tool for making hitboxes if any more characters are added.

//add any patches down here so that they can be turned off or on for replays (add them in a script)