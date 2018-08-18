/// @description draw menu
if (y > 0) {
	y = clamp(y - GUI_HEIGHT*0.02, 0, GUI_HEIGHT)	
}
draw_set_alpha(1)
draw_set_valign(fa_middle)
draw_set_halign(fa_center)
for (var i = 0; i < num; i++) { //for each character
	draw_set_valign(fa_middle)
	var _xx = x + round(GUI_WIDTH*((i + 0.5)/(num))) // 50 either side of this is within the banner
	var _yy = y + real_placing[i, 2]*GUI_HEIGHT*0.05 + GUI_HEIGHT*0.06 - GUI_HEIGHT*0.3*ready[i]//draw lower down the worse the postion
	//draw gui background card
	draw_set_colour(player_col[i])
	draw_rectangle(_xx - 50, _yy, _xx + 50, GUI_HEIGHT, false)
	//draw placing number on top of card
	draw_set_font(fnt_pixel_16)
	draw_text_outlined(_xx + 10, _yy - 17, merge_colour(player_col[i], c_black, 0.25), merge_colour(c_white, c_maroon, (real_placing[i, 2] - 1)/num), string(real_placing[i, 2]), 16)
	//draw player sprite
	pal_swap_set(pal_surface[i], 1, true)
	switch (character[i]) { //change sprite based on character
		case BAL: var _spr = spr_bal_stock; break;
		case MAC: var _spr = spr_mac_stock; break;
		case ETH: var _spr = spr_eth_stock; break;
		case GEO: var _spr = spr_geo_stock; break;
	}
	draw_sprite_ext(_spr, 0, _xx, _yy + 124, 6, 6, 0, c_white, 1)
	pal_swap_reset();
	//draw name
	draw_set_font(fnt_pixel_2)
	draw_text_outlined(_xx, _yy + 129, c_black, c_white, name[i], 2)
	draw_set_font(fnt_pixel_4)

	//draw kills and deaths
	draw_text_outlined(_xx + 2, _yy + 153, c_black, c_white, "K  D", 4)
	draw_set_font(fnt_pixel_3)
	draw_set_valign(fa_bottom)
	var j = 0
	for (var o = 0; o < num; o++) {
		if (kill_count[i, o] + death_count[i, o] = 0) {
			continue
		} else {
			j += 32
			pal_swap_set(pal_surface[o], 1, true)
			switch (character[o]) { //change sprite based on character
				case BAL: var _spr = spr_bal_stock; break;
				case MAC: var _spr = spr_mac_stock; break;
				case ETH: var _spr = spr_eth_stock; break;
				case GEO: var _spr = spr_geo_stock; break;
			}
			draw_sprite_ext(_spr, 0, _xx + 1, _yy + 175 + j, 3, 3, 0, c_white, 1)
			pal_swap_reset();
			if (kill_count[i, o] > 0) {
				draw_text_outlined(_xx - 34, _yy + 173 + j, c_black, c_white, kill_count[i, o], 2)
			}
			if (death_count[i, o] > 0) {
				draw_text_outlined(_xx + 37, _yy + 173 + j, c_black, c_white, death_count[i, o], 2)
			}
		}
	}
}

if (!instance_exists(obj_replay_handler)) { //if not in a replay
	draw_set_colour(c_orange)
	draw_rectangle(GUI_WIDTH*0.5 - 150, GUI_HEIGHT - 20, GUI_WIDTH*0.5 + 150, GUI_HEIGHT, false)
	draw_set_font(fnt_pixel_2)
	if (save_replay) {
		if (instance_exists(obj_save_replay)) {
			draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT - 0, c_black, c_white, "SAVING REPLAY", 2)
		} else {
			draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT - 0, c_black, c_white, "REPLAY SAVED!", 2)
		}
	} else {
		draw_text_outlined(GUI_WIDTH/2, GUI_HEIGHT - 0, c_black, c_white, "SAVE REPLAY? (GRAB)", 2)
	}
}
