/// @description 
scale = 4
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