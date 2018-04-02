/// @description 
image_xscale = 4
image_yscale = 4
last_x = 0
last_y = 0
last_x2 = 0
last_y2 = 0


sprite_idle =		asset_get_index(string("spr_" + character + "_idle"	  ))
sprite_walk =		asset_get_index(string("spr_" + character + "_walk"	  ))
sprite_run =		asset_get_index(string("spr_" + character + "_run"	  ))
sprite_dash =		asset_get_index(string("spr_" + character + "_dash"	  ))
sprite_speed_up =	asset_get_index(string("spr_" + character + "_speed_up"))
sprite_dash_slow =	asset_get_index(string("spr_" + character + "_dash_slow"))
sprite_speed_down = asset_get_index(string("spr_" + character + "_speed_down"))

if (sprite_dash = -1) {
	dashes = false
} else {
	dashes = true
}


sprite_index = sprite_idle