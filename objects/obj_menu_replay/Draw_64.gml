/// @description 
var _yy = y
var _xx = x
draw_set_font(fnt_pixel_2)
draw_set_halign(fa_center)
draw_set_valign(fa_top)

//handle menu offset
if (menu_index < 9) { //top 3 rows
	menu_offset = 0	 //no offset
} else if (menu_index > menu_length - 9) { //last 3 rows
	menu_offset = (menu_length - 13) div 3 //offset is row - 4
} else { //somewhere in the middle
	menu_offset = (menu_index - 6) div 3 //offset is row - 2
}

//make the menu surface if applicable (used to avoid having to redraw the entire menu each frame)
var _spr, _pal, _col; //initialise variables
if (!surface_exists(menu_surface)) { //draw the menu to the menu surface, this surface is then drawn each frame
	menu_surface = surface_create(ceil(GUI_WIDTH*0.6), ceil(((menu_length div 3) + 1)*GUI_HEIGHT*0.2)) //create the surface
	surface_set_target(menu_surface) //set the draw target to be the surface
	draw_clear_alpha($7fa5ff, 1) //clear the surface of noise
	for (var i = 0; i < menu_length; i++) { //for each replay to draw
		_spr = asset_get_index("spr_stage_" + stage[i]) //get the sprite of the stage
		_col = c_white
		if (!sprite_exists(_spr)) { //if there is none,
			_spr = spr_stage_missing //use the stage missing sprite
		}
		if (game_version[i] != global.game_version) { //if incompatible
			_col = c_dkgray	 //draw darker
		}
		_xx = GUI_WIDTH*0.18*(i mod 3) + GUI_WIDTH*0.12 //get the x position to draw the tile
		_yy = GUI_HEIGHT*0.2*(i div 3) + GUI_HEIGHT*0.1//get the y position to draw the tile
		draw_sprite_ext(_spr, 0, _xx, _yy, 0.5, 0.5, 0, _col, 1) //draw the stage sprite at 1/2 scale
		for (var o = 0; o < player_number[i]; o++) { //for each player in the replay
			switch (player_character[i, o]) { //get the sprite and pallet
				case BAL: _spr = spr_bal_stock; _pal = pal_bal; break;
				case MAC: _spr = spr_mac_stock; _pal = pal_mac; break;
				case ETH: _spr = spr_eth_stock; _pal = pal_eth; break;
				case GEO: _spr = spr_geo_stock; _pal = pal_geo; break;
			}
			pal_swap_set(_pal, player_pallet[i, o], false) //set the pallet swap
			draw_sprite_ext(_spr, 0, _xx + 40*(o mod 4) - 60, _yy - 22*(o div 4) + 45, 2, 2, 0, _col, 1)	//draw the sprite
			pal_swap_reset(); //reset pallet swap
		}
		draw_text_outlined(_xx, _yy - GUI_HEIGHT*0.1, c_black, _col, name[i], 2) //draw the name
	}
	surface_reset_target(); //reset drawing to the applicaiton surface
}
//reset menu element offsets
_xx = x
_yy = y
//draw part of the menu surface based on the menu offset
draw_surface_part(menu_surface, 0, menu_offset*GUI_HEIGHT*0.2, GUI_WIDTH*0.6, GUI_HEIGHT, _xx + GUI_WIDTH*0.4, _yy)

//set draw options and draw a background
draw_set_font(fnt_pixel_4)
draw_set_valign(fa_middle)
draw_set_colour($face23)
draw_rectangle(_xx, _yy, _xx + GUI_WIDTH*0.4, _yy + GUI_HEIGHT, false)

//get the time as a formatted string
var _time = time[menu_index]*3600
if (_time > 0) {
	var _str = ""
	if (_time >= 3600*GAME_SPEED) { //greate than an hour
		_str += string(floor(_time/(3600*GAME_SPEED))) + ":"
		if (string_length(string(floor((_time/(60*GAME_SPEED)) mod 60))) = 1) {
			_str += "0"
		}
	}
	if (_time >= 60*GAME_SPEED) { //greate than a minute
		_str += string(floor((_time/(60*GAME_SPEED)) mod 60)) + ":"
		if (string_length(string(floor((_time/(GAME_SPEED)) mod 60))) = 1) {
			_str += "0"
		}
	}
	_str += string(((_time/GAME_SPEED) mod 60))
} else { //timeless
	_str = "FOREVER"	
}

//time is re-used here to save memory space; it holds the string for stocks
_time = string(stocks[menu_index])
if (_time = "0") {
	_time = "INFINITE"	
}

//draw sub menu
for (var i = 0; i < 3; i++) {
	if ((sub_menu > 0) and (sub_menu_index = i)) {
		draw_set_colour($fa67aa)
	} else {
		draw_set_colour($42face)
	}
	draw_rectangle(_xx + GUI_WIDTH*0.05, _yy + GUI_HEIGHT*0.68 + GUI_HEIGHT*0.1*i, _xx + GUI_WIDTH*0.35, _yy + GUI_HEIGHT*0.77 + GUI_HEIGHT*0.1*i, false)
	draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy + GUI_HEIGHT*0.715 + GUI_HEIGHT*0.1*i, c_black, c_white, sub_menu_option[i], 4)
}

//make images darker if they are incompatible
if (game_version[menu_index] = global.game_version) {
	_col = c_white	
} else {
	_col = c_dkgray
}
_spr = asset_get_index("spr_stage_" + stage[menu_index]) //get the sprite of the stage
if (!sprite_exists(_spr)) { //if there is none,
	_spr = spr_stage_missing //use the stage missing sprite
}
draw_sprite_ext(_spr, 0, _xx + GUI_WIDTH*0.2, _yy + GUI_HEIGHT*0.3, 1, 1, 0, _col, 1) //draw the stage sprite 
for (var o = 0; o < player_number[menu_index]; o++) { //for each player in the replay
	switch (player_character[menu_index, o]) { //get the sprite and pallet
		case BAL: _spr = spr_bal_stock; _pal = pal_bal; break;
		case MAC: _spr = spr_mac_stock; _pal = pal_mac; break;
		case ETH: _spr = spr_eth_stock; _pal = pal_eth; break;
		case GEO: _spr = spr_geo_stock; _pal = pal_geo; break;
	}
	pal_swap_set(_pal, player_pallet[menu_index, o], false) //set the pallet swap
	draw_sprite_ext(_spr, 0, _xx + 80*(o mod 4) - 120 + GUI_WIDTH*0.2, _yy - 44*(o div 4) + 90 + GUI_HEIGHT*0.3, 4, 4, 0, _col, 1)	//draw the sprite
	pal_swap_reset(); //reset pallet swap
}
//draw other replay information
draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy + GUI_HEIGHT*0.56, c_black, _col, "STOCKS - " + _time + "\nTIME - " + _str, 4)
draw_text_outlined(_xx + GUI_WIDTH*0.2, _yy + GUI_HEIGHT*0.05, c_black, _col, name[menu_index], 4)

//draw menu index tracker
_xx = x + (menu_index mod 3)*GUI_WIDTH*0.18 + GUI_WIDTH*0.52
_yy = y + ((menu_index div 3) - menu_offset)*GUI_HEIGHT*0.2
draw_set_colour(c_teal)
draw_set_alpha(0.35)
draw_rectangle(_xx - GUI_WIDTH*0.09 - 1, _yy, _xx + GUI_WIDTH*0.09, _yy + GUI_HEIGHT*0.20, false)
draw_set_alpha(1)
draw_set_colour($ff6625)
draw_rectangle(_xx - GUI_WIDTH*0.09 - 1, _yy, _xx + GUI_WIDTH*0.09, _yy + GUI_HEIGHT*0.20, true)
draw_rectangle(_xx - GUI_WIDTH*0.09, _yy + 1, _xx + GUI_WIDTH*0.09 - 1, _yy + GUI_HEIGHT*0.20 - 1, true)