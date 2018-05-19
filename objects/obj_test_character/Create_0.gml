/// @description 
scale = 1
image_xscale = scale
image_yscale = scale
last_x = 0
last_y = 0
last_x2 = 0
last_y2 = 0

grounded = false
dash = 1

sprite_idle =		asset_get_index(string("spr_" + character + "_idle"			))
sprite_walk =		asset_get_index(string("spr_" + character + "_walk"			))
sprite_run =		asset_get_index(string("spr_" + character + "_run"			))
sprite_dash =		asset_get_index(string("spr_" + character + "_dash"			))
sprite_speed_up =	asset_get_index(string("spr_" + character + "_speed_up"		))
sprite_dash_slow =	asset_get_index(string("spr_" + character + "_dash_slow"	))
sprite_speed_down = asset_get_index(string("spr_" + character + "_speed_down"	))
sprite_jump =		asset_get_index(string("spr_" + character + "_jump"			))
sprite_air_move =	asset_get_index(string("spr_" + character + "_air_move"		))
sprite_air_jump =	asset_get_index(string("spr_" + character + "_air_jump"		))
sprite_shield =		asset_get_index(string("spr_" + character + "_shield"		))
sprite_hold_shield =asset_get_index(string("spr_" + character + "_hold_shield"	))
sprite_un_shield =	asset_get_index(string("spr_" + character + "_un_shield"	))
sprite_roll =		asset_get_index(string("spr_" + character + "_roll"			))
sprite_dodge =		asset_get_index(string("spr_" + character + "_dodge"		))
sprite_shield_ball =asset_get_index(string("spr_" + character + "_shield_ball"	))
sprite_tilt_up =	asset_get_index(string("spr_" + character + +"_tilt_up"	))
sprite_tilt_down =	asset_get_index(string("spr_" + character + +"_tilt_down"	))
sprite_tilt_forward =	asset_get_index(string("spr_" + character + +"_tilt_forward"	))
sprite_jab =		asset_get_index(string("spr_" + character + +"_jab_1"	))
sprite_smash_up =	asset_get_index(string("spr_" + character + +"_smash_up"	))
sprite_smash_down =	asset_get_index(string("spr_" + character + +"_smash_down"	))
sprite_smash_forward =	asset_get_index(string("spr_" + character + +"_smash_forward"	))
sprite_aerial_up =	asset_get_index(string("spr_" + character + +"_aerial_up"	))
sprite_aerial_down =	asset_get_index(string("spr_" + character + +"_aerial_down"	))
sprite_aerial_forward =	asset_get_index(string("spr_" + character + +"_aerial_forward"	))
sprite_aerial_back =	asset_get_index(string("spr_" + character + +"_aerial_back"	))
sprite_aerial_neutral =	asset_get_index(string("spr_" + character + +"_aerial_neutral"	))
sprite_special_up =	asset_get_index(string("spr_" + character + +"_special_up"	))
sprite_special_down =	asset_get_index(string("spr_" + character + +"_special_down"	))
sprite_special_forward =	asset_get_index(string("spr_" + character + +"_special_forward"	))
sprite_special_neutral =	asset_get_index(string("spr_" + character + +"_special_neutral"	))

if (sprite_dash = -1) {
	dashes = false
	sprite_dash = sprite_run
	sprite_dash_slow = sprite_run
	sprite_speed_up = sprite_walk
	sprite_speed_down = sprite_walk
} else {
	dashes = true
}


sprite_index = sprite_idle

draw_count = 0